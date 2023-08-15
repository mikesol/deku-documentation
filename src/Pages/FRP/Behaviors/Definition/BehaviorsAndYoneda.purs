module Pages.FRP.Polls.Definition.PollsAndYoneda where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.DOM as D

pollsAndYoneda :: Subsection
pollsAndYoneda = subsection
  { title: "Polls and Yoneda"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ D.Class !:= "font-bold" ] [ text_ "Polls and Yoneda" ]
          , text_ "."
          ]
      ]
  }
