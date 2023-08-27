module ExampleAssitant where

import Prelude

import Deku.Core (Nut)
import Effect (Effect)

type ExampleSignature = (Nut -> Effect (Effect Unit)) -> Effect (Effect Unit)