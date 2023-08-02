module Pages.FRP.OtherInstances.Monoid where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.OtherInstances.Monoid.EventsAsMonoids (eventsAsMonoids)
import Pages.FRP.OtherInstances.Monoid.EventsAsSemigroups (eventsAsSemigroups)

monoid :: Section
monoid = section
  { title: "Monoid"
  , topmatter: pure
      [ D.p_
          [ text "Events can be considered "
          , D.code__ "Monoid"
          , text "s if the underlying type is a "
          , D.code__ "Monoid"
          , text ". This follows the classic pattern of equating "
          , D.code__ "<>"
          , text " with "
          , D.code__ "<*>"
          , text " and "
          , D.code__ "mempty"
          , text " with "
          , D.code__ "pure"
          , text "."
          ]
      ]
  , subsections:
      [ eventsAsSemigroups, eventsAsMonoids ]
  }
