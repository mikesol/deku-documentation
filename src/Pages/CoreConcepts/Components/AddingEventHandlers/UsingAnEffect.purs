module Pages.CoreConcepts.Components.AddingEventHandlers.UsingAnEffect where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import Web.HTML (window)
import Web.HTML.Window (alert)

usingAnEffect :: Subsection
usingAnEffect = subsection
  { title: "Using an effect"
  , matter: pure
      [ D.p_
          [ text
              "The most straightforward event is that which triggers an effectful action, like an alert or an audio snippet."
          ]
      , psCodeWithLink Examples.UsingAnEffect
      , D.p_ [ text "This yields the following result." ]
      , exampleBlockquote
          [ D.span
              [D.OnClick := do
                  window >>= alert "Thanks for clicking!",
                klass "cursor-pointer"]
              [ text "Click me!" ]
          ]
      ]
  }
