module Examples.UnsafeCustomElement where

import Prelude

import Control.Plus (empty)
import Deku.Control (text_)
import Deku.DOM (unsafeCustomElement)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

main :: Effect Unit
main = runInBody do
  unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_) empty
    [ text_ "hi" ]