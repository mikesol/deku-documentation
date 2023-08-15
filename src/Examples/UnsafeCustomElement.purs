module Examples.UnsafeCustomElement where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text, text_)
import Deku.DOM (unsafeCustomElement)

import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

app :: ExampleSignature
app runExample = runExample do
  unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_) []
    [ text_ "hi" ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')