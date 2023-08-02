module Pages.AdvancedUsage.CustomElements where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D
import Pages.AdvancedUsage.CustomElements.DefiningCustomElements (definingCustomElements)
import Pages.AdvancedUsage.CustomElements.UsingIonic (usingIonic)
import Router.ADT (Route(..))

customElements :: Page
customElements = page
  { route: CustomElements
  , topmatter: pure
      [ D.p [D.Class := "lead"]
          [ text "How to bend Deku to do your bidding."
          ]
      , D.p_
          [ text
              "Sometimes, Deku's representation of DOM elements doesn't fit with how you need them to be used. In some cases, the DOM's components are not enough. When you need a bit more out of your DOM, Deku provides a backdoor to define whatever component you want while adding a modicum of type safety to the affair."
          ]
      ]
  , sections:
      [ definingCustomElements, usingIonic ]
  }
