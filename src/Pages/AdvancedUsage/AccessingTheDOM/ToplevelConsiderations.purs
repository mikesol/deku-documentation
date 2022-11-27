module Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations.GlobalHandlers (globalHandlers)
import Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations.Routing (routing)

toplevelConsiderations :: forall lock payload. Section lock payload
toplevelConsiderations = section
  { title: "Top-level considerations"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Top-level considerations" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ routing, globalHandlers ]
  }
