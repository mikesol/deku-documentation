module Pages.FRP.Events.PureEvents.TheLemmingEvent where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Control.Monad.ST.Internal (modify, new, read, run, write)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (href_, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import FRP.Event (Event, createPure, fold, makeLemmingEvent, subscribePure)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

example :: String
example = """module Main where

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
  """ <> tripleQ <> """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" <> tripleQ <> """ :: String

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
        """ <> tripleQ <> """Press the buttons below to add values to the sum.
But beware! Duplicate presses will be ignored,
so be sure to alternate between the buttons.""" <> tripleQ <> """
    , D.div_ $ [ 10, 100, 1000 ] <#> \n ->
        D.button
          Alt.do
            click_ (setInt n)
            klass_ buttonClass
          [ text_ ("Add " <> show n) ]
    , D.div_ [ text $ (show <$> fold (+) 0 (dedup int)) ]
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
    ]"""

theLemmingEvent :: forall lock payload. Subsection lock payload
theLemmingEvent = subsection
  { title: "The lemming event"
  , matter: pure
      [ D.p_
          [ text_ "We've seen how to create pure events via "
          , D.code__ "createPure"
          , text_
              ", but what about pure stand-alone events. We have a problem there. In order to write events that work "
          , D.i__ "both"
          , text_ " in "
          , D.code__ "ST r"
          , text_ " and "
          , D.code__ "Effect"
          , text_
              ", we need to choose a monad to write our logic in that can be lifted into both contexts. This will be important, for example, in SSR - we'll want an event that can be rendered as an HTML string but we will "
          , D.i__ "also"
          , text_
              " want it to be hydrated dynamically via the JavaScript engine."
          ]
      , D.p_
          [ text_ "The solution is "
          , D.code__ "makeLemmingEvent"
          , text_
              ". The idea is that we create an event that accepts two parameters - a callback function as the second argument as well as a subscribe function as the first argument to work with any incoming events. The subscribe function is specialzied to "
          , D.code__ "Effect"
          , text_ " in effectful contexts and "
          , D.code__ "ST r"
          , text_ " in pure contexts. There's an article about this called "
          , D.a
              ( href_ "https://dev.to/mikesol/lifting-continuations-9og" <|>
                  (D.Target !:= "_blank")
              )
              [ text_ "Lifting continuations" ]
          , text_
              " that discusses the logic behind this implementation, but now, I expect you to unchallengingly trust me that this is the best possible implementation. Or, in other words, to be a lemming!"
          ]
      , D.p_
          [ text_ "To better understand how "
          , D.code__ "makeLemmingEffect"
          , text_
              " does its thing, let's see a lemming in the wild! In the example below, a "
          , D.code__ "dedup"
          , text_ " function created using "
          , D.code__ "makeLemmingEvent"
          , text_
              " is used to control both a pure and an impure event. We call it a \"lemming\" because it dutifully follows the monad in which it is asked to produce values."
          ]
          , psCode example
      , exampleBlockquote
          [ Deku.do
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
                , D.div_ [ text $ (show <$> fold (+) 0 (dedup int)) ]
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
          ]
      , D.p_
          [ text_ "The same "
          , D.code__ "dedup"
          , text_ " function was able to be used in the context of a pure event (the calculation of the number 6) "
          , D.i__ "and"
          , text_ " an impure event (the click listener) thanks to "
          , D.code__ "makeLemmingEvent"
          , text_ "."
          ]
      ]
  }
