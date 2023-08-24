module Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalResult where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM.Attributes as DA
import Deku.DOM as D

theGlobalPortalResult :: Subsection
theGlobalPortalResult = subsection
  { title: "The global portal result"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span [ DA.klass_ "font-bold" ]
              [ text_ "The global portal result" ]
          , text_ "."
          ]
      ]
  }
