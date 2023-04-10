module Examples.UnsafeCustomElement where

import Prelude

import Deku.Control (text_)
import Deku.DOM (unsafeCustomElement)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

main :: Effect Unit
main = runInBody do
  unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_) []
    [ text_ "hi" ]