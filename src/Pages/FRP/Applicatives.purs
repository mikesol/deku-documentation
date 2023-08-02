module Pages.FRP.Applicatives where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Page, page)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Applicatives.Applicative (applicative)
import Pages.FRP.Applicatives.Functor (functor)
import Pages.FRP.Applicatives.MonadsAndFlattening (monadsAndFlattening)
import Router.ADT (Route(..))

applicatives :: Page
applicatives = page
  { route: Applicatives
  , topmatter: pure
      [ D.p [D.Class := "lead"]
          [ targetedLink "https://www.youtube.com/watch?v=4AyjKgz9tKg"
              [ text "Conjunction junctor, what's your functor?" ]
          ]
      , D.p_
          [ D.code__ "Event"
          , text " is a "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Data.Functor"
              [ D.code__ "Functor" ]
          , text
              ". It benefits from all the functorial goodness that functorness adorns unto type constructors like "
          , D.code__ "Maybe"
          , text " and "
          , D.code__ "Array"
          , text ". Equally if not more importantly, "
          , D.code__ "Event"
          , text " is an "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Control.Applicative"

              [ D.code__ "Applicative Functor" ]
          , text ". But is it a "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Control.Monad"

              [ D.code__ "Monad" ]
          , text "? To find out, read on!"
          ]
      ]
  , sections:
      [ functor, applicative, monadsAndFlattening ]
  }
