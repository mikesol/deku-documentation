module Scratch where

import Prelude

import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody do
  let
    eieio = fixed
      [ D.span (klass_ "text-blue-400") [ text_ "e " ]
      , D.span (klass_ "text-red-400") [ text_ "i " ]
      , D.span (klass_ "text-green-400") [ text_ "e " ]
      , D.span (klass_ "text-teal-400") [ text_ "i " ]
      , D.span (klass_ "text-orange-400") [ text_ "o" ]
      ]

  D.div_
    [ text_ "Old MacDonald had a farm, "
    , eieio
    , text_ ". And on that farm he had a dog, "
    , eieio
    , text_
        ". With a woof-woof here and a woof-woof there. "
    , text_ "Here a woof, there a woof, everywhere a woof-woof. "
    , text_ "Old MacDonald had a farm, "
    , eieio
    , text_ "."
    ]