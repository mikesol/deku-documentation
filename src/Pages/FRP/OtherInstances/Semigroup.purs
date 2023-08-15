module Pages.FRP.OtherInstances.Semigroup where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.OtherInstances.Semigroup.EventsAsSemigroups (eventsAsSemigroups)

semigroup :: Section
semigroup = section
  { title: "Monoid"
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
          , text_ ". Alas, "
          , D.code__ "Event a"
          , text_ " is not a "
          , D.code__ "Monoid"
          , text_ " because it has no "
          , D.code__ "Applicative"
          , text_ " instance, so we can't do "
          , D.code__ "pure mempty"
          , text_ ". If you really need a "
          , D.code__ "Monoid"
          , text_ " out of an "
          , D.code__ "Event"
          , text_ ", you can always use"
          , D.code__ "Endo"
          , text_ "."
          ]
      ]
  , subsections:
      [ eventsAsSemigroups ]
  }
