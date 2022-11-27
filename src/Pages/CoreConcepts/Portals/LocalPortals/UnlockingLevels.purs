module Pages.CoreConcepts.Portals.LocalPortals.UnlockingLevels where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

unlockingLevels :: forall lock payload. Subsection lock payload
unlockingLevels = subsection
  { title: "Unlocking levels"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Unlocking levels" ]
          , text_ "."
          ]
      ]
  }
