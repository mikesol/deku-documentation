module Pages.FRP.Polls.Definition.PollsAndYoneda where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

pollsAndYoneda :: Subsection
pollsAndYoneda = subsection
  { title: "Polls and Yoneda"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ] [ text_ "Polls and Yoneda" ]
          , text_ "."
          ]
      ]
  }
