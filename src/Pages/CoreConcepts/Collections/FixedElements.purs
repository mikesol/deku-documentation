module Pages.CoreConcepts.Collections.FixedElements where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.FixedElements.GroupsOfGroups (groupsOfGroups)
import Pages.CoreConcepts.Collections.FixedElements.GroupingElementsTogether (groupingElementsTogether)

fixedElements :: Section
fixedElements = section
  { title: "Arrays of components"
  , topmatter: pure
      [ D.p_
          [ text_
              "Sometimes, you have a fixed array of components that you'd like to insert into a parent element. For these cases, there's the "
          , D.code__ "fixed"
          , text_ " operator."
          ]
      ]
  , subsections:
      [ groupingElementsTogether, groupsOfGroups ]
  }
