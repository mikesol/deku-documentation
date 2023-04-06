module Pages.FRP.Behaviors where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Behaviors.Applicative (applicative)
import Pages.FRP.Behaviors.Calculus (calculus)
import Pages.FRP.Behaviors.Definition (definition)
import Pages.FRP.Behaviors.OtherInstances (otherInstances)
import Router.ADT (Route(..))

behaviors :: Page
behaviors = page
  { route: Behaviors
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "Or "
          , D.span (D.Class !:= "font-bold") [ text_ "Behaviours" ]
          , text_ " if you're in 🇬🇧, 🇮🇪, 🇦🇺, 🇨🇦, 🇿🇦, 🇳🇿, 🇧🇼, 🇬🇲, 🇳🇦, 🇿🇲, ..."
          ]
      , D.p_
          [ D.code__ "Behaviors"
          , text_ " are continuous functions of time. "
          , D.code__ "Events"
          , text_
              " are discrete functions of time. Sounds like a marriage made in heaven! Or at least in PureScript. On this page, we'll start by defining the "
          , D.code__ "Behavior"
          , text_
              ", exploring some of its useful typeclass instances and using it to model various time-domain equations."
          ]
      ]
  , sections:
      [ definition, applicative, calculus, otherInstances ]
  }
