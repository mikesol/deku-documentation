module Pages.FRP.OtherInstances.Semigroup where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.OtherInstances.Semigroup.EventsAsSemigroups (eventsAsSemigroups)
import Pages.FRP.OtherInstances.Semigroup.NoMonoid (noMonoid)

semigroup :: Section
semigroup = section
  { title: "Semigroups"
  , topmatter: pure
      [ D.p_
          [ text_ "Events can be considered "
          , D.code__ "Semigroup"
          , text_ "s if the underlying type is a "
          , D.code__ "Semigroup"
          , text_ ". This follows the classic pattern of equating "
          , D.code__ "<>"
          , text_ " with "
          , D.code__ "<*>"
          , text_ "."
          ]
      ]
  , subsections:
      [ eventsAsSemigroups, noMonoid ]
  }
