module Pages.FRP.Polls.Calculus.PollsAsContinuousFunctionsOfTime where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.DOM as D

pollsAsContinuousFunctionsOfTime
  :: Subsection
pollsAsContinuousFunctionsOfTime = subsection
  { title: "Polls as continuous functions of time"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ D.Class !:= "font-bold" ]
              [ text_ "Polls as continuous functions of time" ]
          , text_ "."
          ]
      ]
  }
