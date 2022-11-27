module Pages.FRP.Applicatives.Applicative where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Applicatives.Applicative.ApplicativeAsBiSampling (applicativeAsBiSampling)
import Pages.FRP.Applicatives.Applicative.TheTemporalityOfPure (theTemporalityOfPure)

applicative :: forall lock payload. Section lock payload
applicative = section
  { title: "Applicative"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Applicative" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ applicativeAsBiSampling, theTemporalityOfPure ]
  }
