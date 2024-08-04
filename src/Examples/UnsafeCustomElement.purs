module Examples.UnsafeCustomElement where

import Prelude

import Data.Maybe (Maybe(..))
import Deku.Control (elementify, text_)
import Deku.Core (Nut)
import Deku.DOM (Attribute, HTMLAnchorElement)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (Poll)
import Type.Proxy (Proxy)

type HTMLMyNiftyAnchor (r :: Row Type) =
  ( __tag :: Proxy "HTMLMyNiftyAnchor"
  | HTMLAnchorElement r
  )

myNiftyAnchor
  :: Array (Poll (Attribute (HTMLMyNiftyAnchor ()))) -> Array Nut -> Nut
myNiftyAnchor = elementify Nothing "a"

app :: ExampleSignature
app runExample = runExample do
  myNiftyAnchor [] [ text_ "hi" ]

main :: Effect Unit
main = void $ app runInBody