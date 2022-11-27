module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelf (knowThySelf)
import Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelfT (knowThySelfT)
import Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.SafetyWithSelf (safetyWithSelf)

theSelfAttribute :: forall lock payload. Section lock payload
theSelfAttribute = section
  { title: "Defining custom elements"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Defining custom elements" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ knowThySelf, knowThySelfT, safetyWithSelf ]
  }
