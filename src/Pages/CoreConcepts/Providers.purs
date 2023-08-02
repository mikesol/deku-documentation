module Pages.CoreConcepts.Providers where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((:=))
import Deku.Attributes (href)
import Deku.Control (text)
import Deku.DOM as D
import Pages.CoreConcepts.Providers.FunctionsAsProviders (functionsAsProviders)
import Pages.CoreConcepts.Providers.RowPolymorphism (rowPolymorphism)
import Router.ADT (Route(..))

providers :: Page
providers = page
  { route: Providers
  , topmatter: pure
      [ D.p [D.Class := "lead"]
          [ text "Shuttling stuff through the DOM."
          ]
      , D.p_
          [ text
              "Once you start building your game or web app with Deku, you'll get to the point where you have global information, like authentication status, that you'll need to pass from the top-level of your application to sub-sub-sub-sub components. Additionally, you'll need components to be able to communicate with each other. For example, a component five-levels deep may need to initiate a top-level navigation that completely changes the UI."
          ]
      , D.p_
          [ text
              "Deku has no built-in mechanism to deal with these things, but rather encourages certain practices based on classic functional programming patterns. All of these can be thought of as "
          , D.b__ "Providers"
          , text ", to borrow a term from "
          , D.a [href "https://reactjs.org/docs/context.html"]
              [ text "React" ]
          , text ", but with a more powerful and generic API."
          ]
      ]
  , sections:
      [ functionsAsProviders, rowPolymorphism ]
  }
