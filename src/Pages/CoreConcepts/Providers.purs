module Pages.CoreConcepts.Providers where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Providers.FunctionsAsProviders (functionsAsProviders)
import Pages.CoreConcepts.Providers.RowPolymorphism (rowPolymorphism)
import Router.ADT (Route(..))

providers :: forall lock payload. Page lock payload
providers = page
  { route: Providers
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Providers" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ functionsAsProviders, rowPolymorphism ]
  }
