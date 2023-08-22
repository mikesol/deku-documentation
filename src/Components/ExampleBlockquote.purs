module Components.ExampleBlockquote where

import Prelude

import Deku.DOM.Attributes as DA
import Deku.Core (Nut)
import Deku.DOM as D

exampleBlockquote
  :: Array Nut
  -> Nut
exampleBlockquote = D.blockquote [ DA.klass_ "not-italic" ]

exampleBlockquoteWithHeight
  :: String
  -> Array Nut
  -> Nut
exampleBlockquoteWithHeight h = D.blockquote
  [ DA.klass_ $ "not-italic overflow-y-scroll " <> h ]