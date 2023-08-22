module Pages.FRP.FixAndFold.FixingEvents.Gotchyas where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

gotchyas :: Subsection
gotchyas = subsection
  { title: "Gotchyas"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ] [ text_ "Gotchyas" ]
          , text_ "."
          ]
      ]
  }
