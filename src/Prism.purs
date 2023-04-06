module Prism where

import Prelude

import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Core (Nut)
import Deku.DOM as D
import Effect (Effect)
import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class (liftEffect)
import Effect.Console (log)
import Web.DOM (Element)

foreign import highlightAll :: Effect Unit
foreign import highlightAllAsync :: Effect Unit
foreign import addExpandButton :: Effect Unit

forceHighlight :: Nut
forceHighlight = D.div
  [ klass_ "hidden"
  , D.Self !:= \(_ :: Element) -> do
      highlightAll
      addExpandButton
  ]
  []

forceHighlightAff :: Nut
forceHighlightAff = D.div
  [ klass_ "hidden"
  , D.Self !:= \(_ :: Element) -> launchAff_ do
      delay (Milliseconds 0.0)
      liftEffect highlightAll
      liftEffect addExpandButton
  ]
  []