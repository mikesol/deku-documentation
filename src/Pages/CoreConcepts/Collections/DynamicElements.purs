module Pages.CoreConcepts.Collections.DynamicElements where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.DynamicElements.InsertingInADifferentOrder (insertingInADifferentOrder)
import Pages.CoreConcepts.Collections.DynamicElements.InterComponentCommunication (interComponentCommunication)
import Pages.CoreConcepts.Collections.DynamicElements.MovingElements (movingElements)
import Pages.CoreConcepts.Collections.DynamicElements.RemovingElements (removingElements)
import Pages.CoreConcepts.Collections.DynamicElements.TheUseDynHook (theUseDynHook)

dynamicElements :: Section
dynamicElements = section
  { title: "Dynamic components"
  , topmatter: pure
      [ D.p_
          [ text_
              "Sometimes, instead of dealing with a fixed collection of components, you have a dynamic collection. Classic examples of this include todo lists and contact lists in a chat app. Deku provides the "
          , D.code__ "useDyn"
          , text_
              " hook to facilitate the rendering of dynamic collections. In the following section, we'll build intuition for "
          , D.code__ "useDyn"
          , text_ " through a small Todo app."
          ]
      ]
  , subsections:
      [ theUseDynHook
      , insertingInADifferentOrder
      , movingElements
      , removingElements
      , interComponentCommunication
      ]
  }
