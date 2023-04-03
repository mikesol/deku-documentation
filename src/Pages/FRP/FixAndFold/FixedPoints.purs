module Pages.FRP.FixAndFold.FixedPoints where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.FixAndFold.FixedPoints.TheFixFunction (theFixFunction)
import Pages.FRP.FixAndFold.FixedPoints.WhatIsAFixedPoint (whatIsAFixedPoint)

fixedPoints :: Section
fixedPoints = section
  { title: "Fixed points"
  , topmatter: pure
      [ D.p_
          [ text_
              "Fixed points come up all over functional progrmaming. Browsing the term "
          , targetedLink "https://pursuit.purescript.org/search?q=fix"
              [ text_ "fix" ]
          , text_ " on Pursuit, there are around ~20 versions of "
          , D.code__ "fix"
          , text_ " in various libraries. One of the most magical aspects of "
          , D.code__ "Event"
          , text_
              " is the unique and intuitive way fixed points relate to events. In this section, we'll define what fixed points are in general before delving into their "
          , D.code__ "Event"
          , text_ "-specific representation."
          ]
      ]
  , subsections:
      [ whatIsAFixedPoint, theFixFunction ]
  }
