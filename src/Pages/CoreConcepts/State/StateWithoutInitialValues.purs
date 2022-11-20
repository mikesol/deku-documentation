module Pages.CoreConcepts.State.StateWithoutInitialValues where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.State.StateWithoutInitialValues.EmptyUntilFull (emptyUntilFull)
import Pages.CoreConcepts.State.StateWithoutInitialValues.ANoteOnMemoization (aNoteOnMemoization)

stateWithoutInitialValues :: forall lock payload. Section lock payload
stateWithoutInitialValues = section
  { title: "StateWithoutInitialValues"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "StateWithoutInitialValues"]
            , text_ "."
          ]
      ]
  , subsections:
      [ emptyUntilFull,aNoteOnMemoization]
  }
