module Pages.CoreConcepts.Components.AddingEventHandlers.UsingTheOriginalEvent where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Newtype (unwrap)
import Deku.Attribute ((!:=), cb)
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples
import QualifiedDo.Alt as Alt
import Web.Event.Event (type_)
import Web.HTML (window)
import Web.HTML.Window (alert)

usingTheOriginalEvent :: forall lock payload. Subsection lock payload
usingTheOriginalEvent = subsection
  { title: "Using the original event"
  , matter: pure
      [ D.p_
          [ text_
              "To use the original event, pass "
          ]
      , psCodeWithLink Examples.UsingTheOriginalEvent
      , D.p_ [ text_ "This yields the following result." ]
      , exampleBlockquote
          [ D.span
              Alt.do
                D.OnClick !:= cb \e -> do
                  window >>= alert (unwrap (type_ e))
                klass_ "cursor-pointer"
              [ text_ "Click me!" ]
          ]
      ]
  }
