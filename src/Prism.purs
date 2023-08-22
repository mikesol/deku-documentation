module Prism where

import Prelude

import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Self as Self
import Effect (Effect)
import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class (liftEffect)

foreign import highlightAll :: Effect Unit
foreign import highlightAllAsync :: Effect Unit
foreign import addExpandButton :: Effect Unit

forceHighlight :: Nut
forceHighlight = D.div
  [ DA.klass_ "hidden"
  , Self.self_ \_ -> do
      highlightAll
      addExpandButton
  ]
  []

forceHighlightAff :: Nut
forceHighlightAff = D.div
  [ DA.klass_ "hidden"
  , Self.self_ \_ -> launchAff_ do
      delay (Milliseconds 0.0)
      liftEffect highlightAll
      liftEffect addExpandButton
  ]
  []