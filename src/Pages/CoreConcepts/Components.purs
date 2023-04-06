module Pages.CoreConcepts.Components where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Components.ASimpleComponent (aSimpleComponent)
import Pages.CoreConcepts.Components.AddingAttributes (addingAttributes)
import Pages.CoreConcepts.Components.AddingEventHandlers (addingEventHandlers)
import Router.ADT (Route(..))

components :: Page
components = page
  { route: Components
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "Learn how to make a static page with Deku."
          ]
      , D.p_
          [ text_
              "In the "
          , D.b_ [ text_ "Hello world" ]
          , text_ " example, we saw how "
          , D.code_ [ text_ "text_ (\"Hello world\")" ]
          , text_
              " got transformed into something your eyeballs oggled or screenreader scraggled in the DOM. In Deku, as in most other frameworks from which Deku's ideas are liberally borrowed, we call these "
          , D.b_ [ text_ "Components" ]
          , text_ "."
          ]
      ]
  , sections:
      [ aSimpleComponent, addingAttributes, addingEventHandlers ]
  }
