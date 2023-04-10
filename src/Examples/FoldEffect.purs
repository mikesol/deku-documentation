module Examples.FoldEffect where

import Prelude

import Control.Alt ((<|>))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, fix, fold, sampleOnRight)
import FRP.Event.Effect (bindToEffect)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

foldEBad
  :: forall a b
   . (b -> a -> Effect b)
  -> b
  -> Event a
  -> Event b
foldEBad f b e = flip bindToEffect identity $ fix \i ->
  ( sampleOnRight (i <|> pure (pure b))
      ( e <#> \a b' -> do
          b'' <- b'
          f b'' a
      )
  )

foldEGood
  :: forall a b
   . (b -> a -> Effect b)
  -> b
  -> Event a
  -> Event b
foldEGood f b e = fix \i -> flip bindToEffect identity
  (sampleOnRight (i <|> pure b) (e <#> flip f))

main ∷ Effect Unit
main = runInBody Deku.do
  setThunk1 /\ thunk1 <- useState unit
  setThunk2 /\ thunk2 <- useState unit
  setThunk3 /\ thunk3 <- useState unit
  setThunk4 /\ thunk4 <- useState unit
  let
    thunker p b _ = do
      p unit
      pure (b + 1)
  D.div_
    [ D.button
        [ klass_ buttonClass
        , click_ do
            setThunk1 unit
            setThunk2 unit
        ]
        [ text_ "Increment" ]
    , D.div_
        [ text_ "Counter 1 using \"bad\" "
        , D.code__ "foldE"
        , text_ ": "
        , text
            (show <$> (foldEBad (thunker setThunk3) (-1) thunk1))
        ]
    , D.div_
        [ text_ "Counter 2 using \"good\" "
        , D.code__ "foldE"
        , text_ ": "
        , text
            (show <$> (foldEGood (thunker setThunk4) (-1) thunk2))
        ]
    , D.div_
        [ text_ "Result of \"bad\" "
        , D.code__ "foldE has a time leak"
        , text_ ": "
        , text
            (show <$> (fold (pure <$> add 1) (-1) thunk3))
        ]
    , D.div_
        [ text_ "Result of \"good\" "
        , D.code__ "foldE behaves"
        , text_ ": "
        , text
            (show <$> (fold (pure <$> add 1) (-1) thunk4))
        ]
    ]
