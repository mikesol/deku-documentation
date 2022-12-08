module Pages.CoreConcepts.Components.AddingEventHandlers.UsingAnEffect where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples
import QualifiedDo.Alt as Alt
import Web.HTML (window)
import Web.HTML.Window (alert)

usingAnEffect :: forall lock payload. Subsection lock payload
usingAnEffect = subsection
  { title: "Using an effect"
  , matter: pure
      [ D.p_
          [ text_
              "The most straightforward event is that which triggers an effectful action, like an alert or an audio snippet."
          ]
      , psCodeWithLink Examples.UsingAnEffect
      , D.p_ [ text_ "This yields the following result." ]
      , exampleBlockquote
          [ D.span
              Alt.do
                D.OnClick !:= do
                  window >>= alert "Thanks for clicking!"
                klass_ "cursor-pointer"
              [ text_ "Click me!" ]
          ]
      ]
  }
