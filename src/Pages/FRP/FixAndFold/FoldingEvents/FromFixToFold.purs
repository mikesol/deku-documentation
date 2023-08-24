module Pages.FRP.FixAndFold.FoldingEvents.FromFixToFold where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

fromFixToFold :: Subsection
fromFixToFold = subsection
  { title: "From fix to fold"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ] [ text_ "From fix to fold" ]
          , text_ "."
          ]
      ]
  }
