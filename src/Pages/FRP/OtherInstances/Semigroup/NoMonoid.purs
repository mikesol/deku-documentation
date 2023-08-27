module Pages.FRP.OtherInstances.Semigroup.NoMonoid where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

noMonoid :: Subsection
noMonoid = subsection
  { title: "Events aren't monoids"
  , matter: pure
      [ D.p_
          [ text_ "Alas, "
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
  }
