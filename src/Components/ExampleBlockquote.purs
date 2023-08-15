module Components.ExampleBlockquote where

import Prelude

import Deku.Attributes (klass_)
import Deku.Core (Nut)
import Deku.DOM as D

exampleBlockquote
  :: Array Nut
  -> Nut
exampleBlockquote = D.blockquote [ klass_ "not-italic" ]

exampleBlockquoteWithHeight
  :: String
  -> Array Nut
  -> Nut
exampleBlockquoteWithHeight h = D.blockquote
  [ klass_ $ "not-italic overflow-y-scroll " <> h ]