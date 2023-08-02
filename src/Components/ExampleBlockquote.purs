module Components.ExampleBlockquote where

import Prelude

import Deku.Attributes (klass)
import Deku.Core (Nut)
import Deku.DOM as D

exampleBlockquote
  :: Array Nut
  -> Nut
exampleBlockquote = D.blockquote [ klass "not-italic" ]

exampleBlockquoteWithHeight
  :: String
  -> Array Nut
  -> Nut
exampleBlockquoteWithHeight h = D.blockquote
  [ klass $ "not-italic overflow-y-scroll " <> h ]