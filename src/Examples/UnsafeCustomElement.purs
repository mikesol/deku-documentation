module Examples.UnsafeCustomElement where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text)
import Deku.DOM (unsafeCustomElement)

import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

app :: ExampleSignature
app runExample = runExample do
  unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_) []
    [ text "hi" ]