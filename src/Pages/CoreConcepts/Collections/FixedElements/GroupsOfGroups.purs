module Pages.CoreConcepts.Collections.FixedElements.GroupsOfGroups where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

groupsOfGroups :: forall lock payload. Subsection lock payload
groupsOfGroups = subsection
  { title: "Groups of groups"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Groups of groups" ]
          , text_ "."
          ]
      ]
  }
