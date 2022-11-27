module Pages.FRP.Applicatives.Functor.TheMeaningOfMap where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

theMeaningOfMap :: forall lock payload. Subsection lock payload
theMeaningOfMap = subsection
  { title: "The meaning of map"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "The meaning of map" ]
          , text_ "."
          ]
      ]
  }
