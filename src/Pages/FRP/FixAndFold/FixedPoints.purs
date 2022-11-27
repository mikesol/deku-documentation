module Pages.FRP.FixAndFold.FixedPoints where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.FixAndFold.FixedPoints.TheFixFunction (theFixFunction)
import Pages.FRP.FixAndFold.FixedPoints.WhatIsAFixedPoint (whatIsAFixedPoint)

fixedPoints :: forall lock payload. Section lock payload
fixedPoints = section
  { title: "Fixed points"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Fixed points" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ whatIsAFixedPoint, theFixFunction ]
  }
