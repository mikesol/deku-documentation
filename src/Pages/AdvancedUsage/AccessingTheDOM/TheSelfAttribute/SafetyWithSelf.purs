module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.SafetyWithSelf where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

safetyWithSelf :: Subsection
safetyWithSelf = subsection
  { title: "Safety with Self"
  , matter: pure
      [ D.p_
          [ text_ "Because you're working with the raw DOM when you use "
          , D.code__ "Self"
          , text_ " and "
          , D.code__ "SelfT"
          , text
              ", it's possible to run into issues where you provoke a memory leak by holding onto a reference of an element too long. In general, try to use elements injected by "
          , D.code__ "Self"
          , text_ " and "
          , D.code__ "SelfT"
          , text
              " in the limited context where they make sense, or alternatively, only inject a raw DOM element into every nook and cranny of your app if it is some sort of singleton that should persist throughout the app's entire lifetime."
          ]
      ]
  }
