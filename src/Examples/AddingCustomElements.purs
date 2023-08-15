module Examples.AddingCustomElements where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.These (These(..))
import Deku.Attribute (class Attr, AttributeValue(..), unsafeAttribute, (:=))
import Deku.Control (text, text_)
import Deku.DOM (unsafeCustomElement)
import Deku.DOM as D

import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

data MyPages = JoyrideFM | MikeSolomonOrg
data MyTarget = Blank

instance Attr MyNiftyAnchor_ D.Href MyPages where
  attr _ JoyrideFM = unsafeAttribute $ This$ pure 
    { key: "href", value: Prop' "https://joyride.fm" }
  attr _ MikeSolomonOrg = unsafeAttribute $ This$ pure 
    { key: "href", value: Prop' "https://mikesolomon.org" }

instance Attr MyNiftyAnchor_ D.Target MyTarget where
  attr _ _ = unsafeAttribute $ This$ pure 
    { key: "target", value: Prop' "_blank" }

app :: ExampleSignature
app runExample = runExample do
  unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_)
    [ D.Href := JoyrideFM
    , D.Target := Blank
    ]
    [ text_ "hi" ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')