module Examples.UnsafeCustomElement where

import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text)
import Deku.DOM (unsafeCustomElement)

import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

main :: ExampleSignature
main runExample = runExample do
  unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_) []
    [ text "hi" ]