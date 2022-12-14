module Examples.EffectsInSSR where

import Prelude

import Effect (Effect)
import Components.Code (htmlCode)
import Control.Monad.ST (run)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (guard, text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)
import Deku.Toplevel (runInBody, runSSR)
import QualifiedDo.Alt as Alt

myApp :: forall lock payload. String -> Domable lock payload
myApp s = Deku.do
  setImage /\ image <- useState'
  D.div_
    [ D.h4__ "Hi!"
    , D.a
        Alt.do
          klass_ "cursor-pointer"
          click Alt.do
            pure (setImage unit)
            image $> pure unit
        [ text_ "Click to reveal an image." ]
    , guard (image $> true)
        (D.img (D.Src !:= "https://picsum.photos/150") [])
    , htmlCode s
    ]

main :: Effect Unit
main = runInBody do
  myApp
    (run (runSSR (myApp "innnceeeppption")))