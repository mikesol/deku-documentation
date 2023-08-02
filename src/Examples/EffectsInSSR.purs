module Examples.EffectsInSSR where

import Prelude

import Effect (Effect)
import Components.Code (htmlCode)
import Control.Monad.ST (run)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (guard, text)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)
import Deku.Toplevel (runInBody, runSSR)
import QualifiedDo.Alt as Alt

myApp :: String -> Nut
myApp s = Deku.do
  setImage /\ image <- useState'
  D.div_
    [ D.h4__ "Hi!"
    , D.a
        [ klass "cursor-pointer"
        , click Alt.do
            pure (setImage unit)
            image $> pure unit
        ]
        [ text "Click to reveal an image." ]
    , guard (image $> true)
        (D.img [ D.Src := "https://picsum.photos/150" ] [])
    , htmlCode s
    ]

main :: Effect Unit
main = runInBody do
  myApp
    (run (runSSR (myApp "innnceeeppption")))