module Pages.CoreConcepts.Collections.FixedElements where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.FixedElements.GroupsOfGroups (groupsOfGroups)
import Pages.CoreConcepts.Collections.FixedElements.GroupingElementsTogether (groupingElementsTogether)

fixedElements :: Section
fixedElements = section
  { title: "Arrays of components"
  , topmatter: pure
      [ D.p_
          [ text
              "Sometimes, you have a fixed array of components that you'd like to insert into a parent element. For these cases, there's the "
          , D.code__ "fixed"
          , text " operator."
          ]
      ]
  , subsections:
      [ groupingElementsTogether, groupsOfGroups ]
  }
