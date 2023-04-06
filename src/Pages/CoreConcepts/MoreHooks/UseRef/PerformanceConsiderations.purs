module Pages.CoreConcepts.MoreHooks.UseRef.PerformanceConsiderations where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

performanceConsiderations :: Subsection
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: pure
      [ D.p_
          [ text_ "The alternative to "
          , D.code__ "useRef"
          , text_
              " is pandemonium and chaos. No, just kidding, it's using an event to replace a listener."
          ]
      , D.p_
          [ text_ "In the example above, instead of "
          , D.code__ "click_ $ intRef >>= show >>> setButtonText"
          , text_ ", we could have written "
          , D.code__ "click $ num <#> show >>> setButton"
          , text_
              ". While the functionality would be the same, the performance would be much worse, as every click listener would be updated every time the slider moved. Who wants that? So use "
          , D.code__ "useRef"
          , text_
              " whenever you have a lot of listeners that depend on the content of a single value emitted by an event."
          ]
      ]
  }
