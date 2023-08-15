module Pages.CoreConcepts.Collections.Monoids where

import Prelude

import Components.ProTip (proTip)
import Contracts (Env(..), Section, getEnv, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.Monoids.ComponentsAsMonoids (componentsAsMonoids)
import Pages.CoreConcepts.Collections.Monoids.ComponentsAsSemigroups (componentsAsSemigroups)
import Router.ADT (Route(..))

monoids :: Section
monoids = section
  { title: "Monoids"
  , topmatter: do
      Env { routeLink } <- getEnv
      pure
        [ D.p_
            [ text_ "Deku components are also "
            , D.b__ "Monoids"
            , text_
                ", which means they can be appended together. Furthermore, there is the empty component "
            , D.code__ "blank"
            , text_
                " that, when appended to any component, yields the component back."
            ]
        , proTip
            { header: text_ "Terminology brush up"
            , message: D.div_
                [ text_ "When we talk about "
                , D.code__ "Semigroup"
                , text_ " and "
                , D.code__ "Monoid"
                , text_
                    " instances for Deku components, we're referring to components as defined in the "
                , routeLink Components
                , text_ " section. That is, they are PureScript terms with type "
                , D.code__ "Nut"
                , text_ ". As "
                , D.code__ "Nut"
                , text_ " is a "
                , D.code__ "newtype"
                , text_ ", we can implement typeclass instances for it."
                ]
            }
        ]
  , subsections:
      [ componentsAsSemigroups, componentsAsMonoids ]
  }
