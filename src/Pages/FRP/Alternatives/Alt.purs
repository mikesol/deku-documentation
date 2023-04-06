module Pages.FRP.Alternatives.Alt where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Alternatives.Alt.TheOneOfFunction (theOneOfFunction)
import Pages.FRP.Alternatives.Alt.PerformanceConsiderations (performanceConsiderations)
import Pages.FRP.Alternatives.Alt.AltAsAMuxer (altAsAMuxer)

alt :: Section
alt = section
  { title: "Alt"
  , topmatter: pure
      [ D.p_
          [ text_
              "Alt is a way to combine two or more event streams, or to \"mux\" them in streaming lingo. We'll start with an example of simple muxing, followed by multiplexed muxing and finishing with some performance considerations to keep in mind."
          ]
      ]
  , subsections:
      [ altAsAMuxer, theOneOfFunction, performanceConsiderations ]
  }
