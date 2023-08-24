module Pages.FRP.FixAndFold.FoldingEvents.FoldIsState where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

foldIsState :: Subsection
foldIsState = subsection
  { title: "Fold is state"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ] [ text_ "Fold is state" ]
          , text_ "."
          ]
      ]
  }
