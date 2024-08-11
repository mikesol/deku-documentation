module Pages.FRP.Applicatives.Applicative where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Applicatives.Applicative.ApplicativeAsBiSampling (applicativeAsBiSampling)
import Pages.FRP.Applicatives.Applicative.PurityOutOfThinAir (theTemporalityOfPure)

applicative :: Section
applicative = section
  { title: "Applicative"
  , topmatter: pure
      [ D.p_
          [ D.code__ "In addition to being a "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Data.Functor"
              [ D.code__ "Functor" ]
          , text_
              ", "
          , D.code__ "Event"
          , text_ " is an "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Control.Applicative"
              [ D.code__ "Applicative Functor" ]
          , text_
              ". The implementation of the applicative functions, as well as their conformity to the applicative laws, is less obvious than those of functor, so we take a bit extra care to define how these are defined and why they’re lawful."
          ]
      ]
  , subsections:
      [ applicativeAsBiSampling, theTemporalityOfPure ]
  }
