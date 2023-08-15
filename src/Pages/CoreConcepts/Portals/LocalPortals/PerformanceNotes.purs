module Pages.CoreConcepts.Portals.LocalPortals.PerformanceNotes where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

performanceNotes :: Subsection
performanceNotes = subsection
  { title: "Performance notes"
  , matter: pure
      [ D.p_
          [ text
              "Had we used "
          , D.code__ "globalPortal"
          , text
              " for the inner portal, every time the video was shuffled, a new portal would have been created "
          , D.i__ "without"
          , text
              " the old one being cleaned up. That means that, if we clicked on "
          , D.b__ "Shuffle video"
          , text
              " 100 times, 100 \"zombie\" videos would be hanging out in JavaScript."
          ]
      , D.p_
          [ text
              "That being said, 100 zombies aren't that bad. In fact, we've tested portals with thousands of videos and the difference between global and local is negligible. That's because modern JavaScript engines are smart enough to have a very low memory profile for DOM nodes that are not used, and Deku's internal representation only consumes a fistfull of bytes. We recommend using local portals in memory-constrained environments, in older browsers, or when working with custom DOM elements that have significant memory requirements or DOM elements that are tied to large framework-allocated resources (ie canvases that are filled with thousands of ThreeJS meshes)."
          ]

      ]
  }
