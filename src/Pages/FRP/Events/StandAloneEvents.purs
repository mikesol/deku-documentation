module Pages.FRP.Events.StandAloneEvents where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Events.StandAloneEvents.MultipleSubscriptions (multipleSubscriptions)
import Pages.FRP.Events.StandAloneEvents.UnsubscribeEtiquette (unsubscribeEtiquette)
import Pages.FRP.Events.StandAloneEvents.TheMakeEventFunction (theMakeEventFunction)

standAloneEvents :: forall lock payload. Section lock payload
standAloneEvents = section
  { title: "StandAloneEvents"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "StandAloneEvents"]
            , text_ "."
          ]
      ]
  , subsections:
      [ multipleSubscriptions,unsubscribeEtiquette,theMakeEventFunction]
  }
