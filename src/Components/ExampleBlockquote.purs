module Components.ExampleBlockquote where

import Prelude

import Deku.Attributes (klass_)
import Deku.Core (Domable)
import Deku.DOM as D

exampleBlockquote
  :: forall lock1 payload2
   . Array (Domable lock1 payload2)
  -> Domable lock1 payload2
exampleBlockquote = D.blockquote (klass_ "not-italic")

exampleBlockquoteWithHeight
  :: forall lock1 payload2
   . String
  -> Array (Domable lock1 payload2)
  -> Domable lock1 payload2
exampleBlockquoteWithHeight h = D.blockquote
  (klass_ $ "not-italic overflow-y-scroll " <> h)