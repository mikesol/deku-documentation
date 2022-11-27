module Pages.FRP.OtherInstances.Monoid where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.OtherInstances.Monoid.EventsAsMonoids (eventsAsMonoids)
import Pages.FRP.OtherInstances.Monoid.EventsAsSemigroups (eventsAsSemigroups)

monoid :: forall lock payload. Section lock payload
monoid = section
  { title: "Monoid"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Monoid" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ eventsAsSemigroups, eventsAsMonoids ]
  }
