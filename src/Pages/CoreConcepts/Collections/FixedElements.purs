module Pages.CoreConcepts.Collections.FixedElements where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Collections.FixedElements.GroupsOfGroups (groupsOfGroups)
import Pages.CoreConcepts.Collections.FixedElements.GroupingElementsTogether (groupingElementsTogether)

fixedElements :: forall lock payload. Section lock payload
fixedElements = section
  { title: "FixedElements"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "FixedElements" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ groupsOfGroups, groupingElementsTogether ]
  }
