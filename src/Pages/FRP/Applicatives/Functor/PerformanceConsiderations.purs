module Pages.FRP.Applicatives.Functor.PerformanceConsiderations where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

performanceConsiderations :: Subsection
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: pure
      [ D.p_
          [ text "The double-application of "
          , D.code__ "lcmap"
          , text
              " winds up creating two additional functions on top of the original event. That means two additional thunks, which can tank performance if you chain together hundreds of maps for the same event. This is the case of most functors, and for small numbers of maps it doesn't matter, but when every millisecond counts you don't want your maps to bog you down!"
          ]
      , D.p__
          "There are two common solutions to the performance problem with maps, both of which can help improve performance if needed:"
      , D.ul_
          [ D.li_
              [ text "Combine several maps into a single function if possible."
              ]
          , D.li_
              [ text "Use a structure like a "
              , targetedLink
                  "https://github.com/natefaubion/purescript-free-semigroupoid"
                  [ text "Free Semigroupoid" ]
              , text
                  " to collect function applications and fold over them to compose them. While this is inefficient for small quantities of maps, it pays off for 100s of maps."
              ]
          ]
      ]
  }
