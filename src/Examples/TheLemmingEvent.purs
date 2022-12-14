module Examples.TheLemmingEvent where

import Prelude

import Control.Monad.ST.Internal (modify, new, read, run, write)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, createPure, fold, makeLemmingEvent, subscribePure)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

main :: Effect Unit
main = runInBody Deku.do
  setInt /\ int <- useState 0
  let
    dedup :: forall a. Eq a => Event a -> Event a
    dedup e = makeLemmingEvent \subscribe callback -> do
      rf <- new Nothing
      u <- subscribe e \i -> do
        v <- read rf
        when (v /= Just i) do
          callback i
          void $ write (Just i) rf
      pure u
  D.div_
    [ D.div__
        """Press the buttons below to add values to the sum.
But beware! Duplicate presses will be ignored,
so be sure to alternate between the buttons."""
    , D.div_ $ [ 10, 100, 1000 ] <#> \n ->
        D.button
          Alt.do
            click_ (setInt n)
            klass_ buttonClass
          [ text_ ("Add " <> show n) ]
    , D.div_ [ text (show <$> fold (+) 0 (dedup int)) ]
    , D.div_
        [ text_ "And check out this pure number! "
        , text_ $ show $ run do
            { push, event } <- createPure
            rf <- new 0
            _ <- subscribePure (dedup event) \n -> do
              void $ modify (add n) rf
            push 1
            push 1
            push 2
            push 2
            push 2
            push 3
            push 3
            read rf
        ]
    ]