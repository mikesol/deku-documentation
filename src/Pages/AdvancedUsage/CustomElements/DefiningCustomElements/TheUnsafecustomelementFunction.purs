module Pages.AdvancedUsage.CustomElements.DefiningCustomElements.TheUnsafeCustomElementFunction where

import Prelude

import Components.Code (psCodeNoCollapseWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Plus (empty)
import Deku.Control (text_)
import Deku.DOM (unsafeCustomElement)
import Deku.DOM as D
import Examples as Examples
import Type.Proxy (Proxy(..))

data MyNiftyAnchor_

theUnsafeCustomElementFunction :: forall lock payload. Subsection lock payload
theUnsafeCustomElementFunction = subsection
  { title: "The unsafeCustomElement function"
  , matter: pure
      [ D.p_
          [ text_ "In order to create a custom element, use the "
          , D.code__ "unsafeCustomElement"
          , text_
              " function. It's actually pretty safe all things considered, as the worst it can do is crash your app. Unless your app is controlling traffic lights or something, in which case it is definitely not safe."
          ]
      , D.p_
          [ text_
              "As Deku has the whole DOM covered, there's not a single tag we can think of that isn't Deku-ified. So this method is only useful to create custom aliases for tags that have different behaviors "
          , D.i__ "or"
          , text_ " to add new tags if Deku is out of line with the DOM spec."
          ]
      , psCodeNoCollapseWithLink Examples.UnsafeCustomElement
      , exampleBlockquote
          [ unsafeCustomElement "a" (Proxy :: _ MyNiftyAnchor_) empty
              [ text_ "hi" ]
          ]
      ]
  }
