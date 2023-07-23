module Pages.FRP.OtherInstances.Monoid where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.OtherInstances.Monoid.EventsAsMonoids (eventsAsMonoids)
import Pages.FRP.OtherInstances.Monoid.EventsAsSemigroups (eventsAsSemigroups)

monoid :: Section
monoid = section
  { title: "Monoid"
  , topmatter: pure
      [ D.p_
          [ text_ "Events can be considered "
          , D.code__ "Monoid"
          , text_ "s if the underlying type is a "
          , D.code__ "Monoid"
          , text_ ". This follows the classic pattern of equating "
          , D.code__ "<>"
          , text_ " with "
          , D.code__ "<*>"
          , text_ " and "
          , D.code__ "mempty"
          , text_ " with "
          , D.code__ "pure"
          , text_ "."
          ]
      ]
  , subsections:
      [ eventsAsSemigroups, eventsAsMonoids ]
  }
