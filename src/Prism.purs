module Prism where

import Prelude

import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Core (Nut)
import Deku.DOM as D
import Effect (Effect)
import Web.DOM (Element)

foreign import highlightAll :: Effect Unit
foreign import highlightAllAsync :: Effect Unit

forceHighlight :: Nut
forceHighlight = D.div
  ( oneOf
      [ klass_ "hidden"
      , D.Self !:= \(_ :: Element) ->
          highlightAll
      ]
  )
  []