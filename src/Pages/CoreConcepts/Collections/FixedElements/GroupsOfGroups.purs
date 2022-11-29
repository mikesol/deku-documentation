module Pages.CoreConcepts.Collections.FixedElements.GroupsOfGroups where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

groupsOfGroups :: forall lock payload. Subsection lock payload
groupsOfGroups = subsection
  { title: "Groups of groups"
  , matter: pure
      [ D.p_
          [ text_ "Because ", D.code__ "fixed", text_ " does not create a DOM element for its content, one may wonder how multiple nested ", D.code__ "fixed", text_ " are handled. In Deku, they are always flattened into the lower-most logical parent element. So if there is a fixed in a fixed in a fixed, the inner-most fixed has the same parent as the top-most fixed."
          ]
      ]
  }
