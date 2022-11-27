module Pages.CoreConcepts.State.StateWithoutInitialValues.ANoteOnMemoization where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

aNoteOnMemoization :: forall lock payload. Subsection lock payload
aNoteOnMemoization = subsection
  { title: "A note on memoization"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "A note on memoization" ]
          , text_ "."
          ]
      ]
  }
