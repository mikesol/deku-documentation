module ExampleAssitant where

import Prelude

import Deku.Core (Nut)
import Deku.Toplevel (runInBody')
import Effect (Effect)

type ExampleSignature = Effect (Effect Unit)

runExample :: Nut -> Effect (Effect Unit)
runExample = map (map (void)) runInBody'