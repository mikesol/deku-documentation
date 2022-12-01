module Pages.CoreConcepts.Portals.LocalPortals.PerformanceNotes where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

performanceNotes :: forall lock payload. Subsection lock payload
performanceNotes = subsection
  { title: "Performance notes"
  , matter: pure
      [ D.p_
          [ text_
              "Had we used "
          , D.code__ "globalPortal"
          , text_
              " for the inner portal, every time the video was shuffled, a new portal would have been created "
          , D.i__ "without"
          , text_ " the old one being cleaned up. That means that, if we clicked on "
          , D.b__ "Shuffle video"
          , text_
              " 100 times, 100 \"zombie\" videos would be hanging out in JavaScript, eating up memory and CPU."
          ]
      , D.p_
          [ text_
              "In a HTML5 game like a first-person shooter, if you use videos for VFX, you're likely creating 10s of VFX a second. In most cases, these won't be portals, in which case Deku's memory management system will handle them automatically. However, if they "
          , D.i__ "are"
          , text_
              " portals, you want them to be cleaned up as soon as their parents go off screen. In these cases, make sure to use "
          , D.code__ "portal1"
          , text_ " instead of "
          , D.code__ "globalPortal1"
          , text_ "!"
          ]

      ]
  }
