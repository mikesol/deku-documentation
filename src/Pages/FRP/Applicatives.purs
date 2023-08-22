module Pages.FRP.Applicatives where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Page, page)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Applicatives.Applicative (applicative)
import Pages.FRP.Applicatives.Functor (functor)
import Pages.FRP.Applicatives.MonadsAndFlattening (monadsAndFlattening)
import Router.ADT (Route(..))

applicatives :: Page
applicatives = page
  { route: Applicatives
  , topmatter: pure
      [ D.p [DA.klass_ "lead"]
          [ targetedLink "https://www.youtube.com/watch?v=4AyjKgz9tKg"
              [ text_ "Conjunction junctor, what's your functor?" ]
          ]
      , D.p_
          [ D.code__ "Event"
          , text_ " is a "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Data.Functor"
              [ D.code__ "Functor" ]
          , text_
              ". It benefits from all the functorial goodness that functorness adorns unto type constructors like "
          , D.code__ "Maybe"
          , text_ " and "
          , D.code__ "Array"
          , text_ ". Equally if not more importantly, "
          , D.code__ "Event"
          , text_ " is an "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Control.Applicative"

              [ D.code__ "Applicative Functor" ]
          , text_ ". But is it a "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Control.Monad"

              [ D.code__ "Monad" ]
          , text_ "? To find out, read on!"
          ]
      ]
  , sections:
      [ functor, applicative, monadsAndFlattening ]
  }
