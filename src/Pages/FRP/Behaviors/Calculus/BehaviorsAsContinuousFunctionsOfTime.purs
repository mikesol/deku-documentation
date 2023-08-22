module Pages.FRP.Polls.Calculus.PollsAsContinuousFunctionsOfTime where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

pollsAsContinuousFunctionsOfTime
  :: Subsection
pollsAsContinuousFunctionsOfTime = subsection
  { title: "Polls as continuous functions of time"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ]
              [ text_ "Polls as continuous functions of time" ]
          , text_ "."
          ]
      ]
  }
