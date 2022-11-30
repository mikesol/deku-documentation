module Pages.CoreConcepts.Collections.DynamicElements where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.DynamicElements.TheUseDynHook (theUseDynHook)
import Pages.CoreConcepts.Collections.DynamicElements.InsertingInADifferentOrder (insertingInADifferentOrder)
import Pages.CoreConcepts.Collections.DynamicElements.MovingElements (movingElements)
import Pages.CoreConcepts.Collections.DynamicElements.RemovingElements (removingElements)

dynamicElements :: forall lock payload. Section lock payload
dynamicElements = section
  { title: "Dynamic elements"
  , topmatter: pure
      [ D.p_
          [ text_ "Sometimes, instead of dealing with a dynamic collection of elements you have a fixed collection. Classic examples of this include todo lists and a list of chats in a chat app. Deku provides the ", D.code__ "useDyn", text_ " hook to facilitate this. In the following section, we'll build intuition for ", D.code__ "useDyn", text_ "through a small Todo app."
          ]
      ]
  , subsections:
      [ theUseDynHook
      , insertingInADifferentOrder
      , movingElements
      , removingElements
      ]
  }
