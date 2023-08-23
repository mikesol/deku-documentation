module Examples.EffectsInSSR where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState')
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody', runSSR)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

htmlCode :: String -> Nut
htmlCode code = D.pre [ DA.klass_ "prism-code language-markup" ]
  [ D.code_
      [ text_ code
      ]
  ]

myApp :: String -> Nut
myApp s = Deku.do
  setImage /\ image <- useState'
  D.div_
    [ D.h4__ "Hi!"
    , D.a
        [ DA.klass_ "cursor-pointer"
        , DL.runOn DL.click $ (pure unit <|> image) <#> setImage
        ]
        [ text_ "Click to reveal an image." ]
    , guard (image $> true)
        (D.img [ DA.src_ "https://picsum.photos/150" ] [])
    , htmlCode s
    ]

app :: ExampleSignature
app runExample = do
  res <- liftST $ runSSR (myApp "innnceeeppption")
  runExample (myApp res)

main :: Effect Unit
main = void $ app (map (map void) runInBody')