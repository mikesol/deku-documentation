module Pages.AdvancedUsage.CustomElements.DefiningCustomElements.AddingCustomElementsToTheDOM where

import Prelude

import QualifiedDo.Alt as Alt
import Components.Code (psCodeNoCollapse)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Deku.Attribute (class Attr, AttributeValue(..), unsafeAttribute, (!:=))
import Deku.Control (text_)
import Deku.DOM (unsafeCustomElement)
import Deku.DOM as D
import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

data MyPages = JoyrideFM | MikeSolomonOrg
data MyTarget = Blank

instance Attr MyNiftyAnchor_ D.Href MyPages where
  attr _ JoyrideFM = unsafeAttribute
    { key: "href", value: Prop' "https://joyride.fm" }
  attr _ MikeSolomonOrg = unsafeAttribute
    { key: "href", value: Prop' "https://mikesolomon.org" }

instance Attr MyNiftyAnchor_ D.Target MyTarget where
  attr _ _ = unsafeAttribute
    { key: "target", value: Prop' "_blank" }

addingCustomElementsToTheDOM :: forall lock payload. Subsection lock payload
addingCustomElementsToTheDOM = subsection
  { title: "Defining attributes"
  , matter: pure
      [ D.p_
          [ text_
              "Things get more interesting when custom attributes are involved. By defining what attributes are settable for your custom element and how they should be marshaled into strings or listeners, you can create domain-specific logic for your DOM."
          ]
      , psCodeNoCollapse
          """module Main where

import Prelude

import Deku.Toplevel (runInBody)
import QualifiedDo.Alt as Alt
import Effect (Effect)
import Deku.Attribute (class Attr, AttributeValue(..), unsafeAttribute, (!:=))
import Deku.Control (text_)
import Deku.DOM (unsafeCustomElement)
import Deku.DOM as D
import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

data MyPages = JoyrideFM | MikeSolomonOrg
data MyTarget = Blank

instance Attr MyNiftyAnchor_ D.Href MyPages where
  attr _ JoyrideFM = unsafeAttribute
    { key: "href", value: Prop' "https://joyride.fm" }
  attr _ MikeSolomonOrg = unsafeAttribute
    { key: "href", value: Prop' "https://mikesolomon.org" }

instance Attr MyNiftyAnchor_ D.Target MyTarget where
  attr _ _ = unsafeAttribute
    { key: "target", value: Prop' "_blank" }

main ∷ Effect Unit
main = runInBody do
  unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_)
    Alt.do
      D.Href !:= JoyrideFM
      D.Target !:= Blank
    [ text_ "hi" ]"""
      , exampleBlockquote
          [ unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_)
              Alt.do
                D.Href !:= JoyrideFM
                D.Target !:= Blank
              [ text_ "hi" ]
          ]
      ]
  }
