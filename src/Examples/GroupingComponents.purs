module Examples.GroupingComponents where

import Prelude

import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody do
  let
    eieio = fixed
      [ D.span [ klass "text-blue-400" ] [ text "e " ]
      , D.span [ klass "text-red-400" ] [ text "i " ]
      , D.span [ klass "text-green-400" ] [ text "e " ]
      , D.span [ klass "text-teal-400" ] [ text "i " ]
      , D.span [ klass "text-orange-400" ] [ text "o" ]
      ]

  D.div_
    [ text "Old MacDonald had a farm, "
    , eieio
    , text ". And on that farm he had a dog, "
    , eieio
    , text
        ". With a woof-woof here and a woof-woof there. "
    , text "Here a woof, there a woof, everywhere a woof-woof. "
    , text "Old MacDonald had a farm, "
    , eieio
    , text "."
    ]