module Pages.CoreConcepts.Collections.Monoids where

import Prelude

import Components.ProTip (proTip)
import Contracts (Env(..), Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.Monoids.ComponentsAsMonoids (componentsAsMonoids)
import Pages.CoreConcepts.Collections.Monoids.ComponentsAsSemigroups (componentsAsSemigroups)
import Router.ADT (Route(..))

monoids :: Section
monoids = section
  { title: "Monoids"
  , topmatter: \(Env { routeLink }) ->
      [ D.p_
          [ text "Deku components are also "
          , D.b__ "Monoids"
          , text
              ", which means they can be appended together. Furthermore, there is the empty component "
          , D.code__ "blank"
          , text
              " that, when appended to any component, yields the component back."
          ]
      , proTip
          { header: text "Terminology brush up"
          , message: D.div_
              [ text "When we talk about "
              , D.code__ "Semigroup"
              , text " and "
              , D.code__ "Monoid"
              , text
                  " instances for Deku components, we're referring to components as defined in the "
              , routeLink Components
              , text " section. That is, they are PureScript terms with type "
              , D.code__ "Nut"
              , text ". As "
              , D.code__ "Nut"
              , text " is a "
              , D.code__ "newtype"
              , text ", we can implement typeclass instances for it."
              ]
          }
      ]
  , subsections:
      [ componentsAsSemigroups, componentsAsMonoids ]
  }
