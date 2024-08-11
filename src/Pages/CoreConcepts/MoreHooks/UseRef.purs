module Pages.CoreConcepts.MoreHooks.UseRef where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.UseRef.TheCaseForRef (theCaseForRef)
import Pages.CoreConcepts.MoreHooks.UseRef.PerformanceConsiderations (performanceConsiderations)

useRef :: Section
useRef = section
  { title: "Use ref"
  , topmatter: pure
      [ D.p_
          [ text_ "The "
          , D.code__ "useMailboxed"
          , text_ " hook has a spiritual cousin of sorts called "
          , D.code__ "useRef"
          , text_
              ". They both exist as performance optimizations. As you learned in the last section, "
          , D.code__ "useMailboxed"
          , text_ " is used to reduce the number of subscriptions to an event. "
          , D.code__ "useRef"
          , text_
              " takes this one step further, reducing the number of subscriptions to one. If you can get the number lower, I’ll eat my hat!"
          ]
      ]
  , subsections:
      [ theCaseForRef, performanceConsiderations ]
  }
