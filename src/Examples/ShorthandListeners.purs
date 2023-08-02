module Examples.ShorthandListeners where

import Prelude

import Deku.DOM as D
import Deku.Listeners (slider)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Class.Console (logShow)

main :: Effect Unit
main = runInBody
  (D.input (slider logShow) [])