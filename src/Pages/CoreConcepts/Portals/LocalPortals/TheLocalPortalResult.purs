module Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalResult where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

theLocalPortalResult :: Subsection
theLocalPortalResult = subsection
  { title: "The local portal result"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ]
              [ text_ "The local portal result" ]
          , text_ "."
          ]
      ]
  }
