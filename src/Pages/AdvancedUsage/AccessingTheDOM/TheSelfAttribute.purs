module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelf (knowThySelf)
import Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelfT (knowThySelfT)
import Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.SafetyWithSelf (safetyWithSelf)

theSelfAttribute :: Section
theSelfAttribute = section
  { title: "The Self attribute"
  , topmatter: pure
      [ D.p_
          [ text_ "All Deku elements can get a reference to themself via the "
          , D.code__ "Self"
          , text
              " attribute. This section covers how to wield that power for good and not for evil."
          ]
      ]
  , subsections:
      [ knowThySelf, knowThySelfT, safetyWithSelf ]
  }
