module Pages.FRP.Polls where

import Prelude

import Contracts (Page, page)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Polls.Applicative (applicative)
import Pages.FRP.Polls.Calculus (calculus)
import Pages.FRP.Polls.Definition (definition)
import Pages.FRP.Polls.OtherInstances (otherInstances)
import Router.ADT (Route(..))

polls :: Page
polls = page
  { route: Polls
  , topmatter: pure
      [ D.p [DA.klass_ "lead"]
          [ text_ "Or "
          , D.span [DA.klass_ "font-bold"] [ text_ "Behaviours" ]
          , text_ " if you're in 🇬🇧, 🇮🇪, 🇦🇺, 🇨🇦, 🇿🇦, 🇳🇿, 🇧🇼, 🇬🇲, 🇳🇦, 🇿🇲, ..."
          ]
      , D.p_
          [ D.code__ "Polls"
          , text_ " are continuous functions of time. "
          , D.code__ "Events"
          , text_
              " are discrete functions of time. Sounds like a marriage made in heaven! Or at least in PureScript. On this page, we'll start by defining the "
          , D.code__ "Poll"
          , text_
              ", exploring some of its useful typeclass instances and using it to model various time-domain equations."
          ]
      ]
  , sections:
      [ definition, applicative, calculus, otherInstances ]
  }
