module Examples.EffectsInSSR where

import Prelude
import Effect (Effect)

import Control.Monad.ST.Class (liftST)
import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState')
import Deku.Listeners (click)
import Deku.Toplevel (runInBody', runSSR)
import ExampleAssitant (ExampleSignature)

htmlCode :: String -> Nut
htmlCode code = D.pre [ D.Class := "prism-code language-markup" ]
  [ D.code_
      [ text code
      ]
  ]

myApp :: String -> Nut
myApp s = Deku.do
  setImage /\ image <- useState'
  D.div_
    [ D.h4__ "Hi!"
    , D.a
        [ klass "cursor-pointer"
        , click $ (setImage unit) :| (image $> pure unit)
        ]
        [ text "Click to reveal an image." ]
    , guard (image $> true)
        (D.img [ D.Src := "https://picsum.photos/150" ] [])
    , htmlCode s
    ]

app :: ExampleSignature
app runExample = do
  res <- liftST $ runSSR (myApp "innnceeeppption")
  runExample (myApp res)

main :: Effect Unit
main = void $ app (map (map void) runInBody')