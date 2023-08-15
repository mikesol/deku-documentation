module Pages.CoreConcepts.MoreHooks.CustomHooks where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.CustomHooks.NestedHooks (nestedHooks)
import Pages.CoreConcepts.MoreHooks.CustomHooks.TheAnatomyOfAHook (theAnatomyOfAHook)

customHooks :: Section
customHooks = section
  { title: "Custom hooks"
  , topmatter: pure
      [ D.p_
          [ text
              "Sometimes, Deku's amazingly versatile, hand crafted, meticulously curated library of hooks is not good enough for our most discerning, demanding, and sophisticated users. If you are in that category, read on to learn how to make custom hooks!"
          ]
      ]
  , subsections:
      [ theAnatomyOfAHook, nestedHooks ]
  }
