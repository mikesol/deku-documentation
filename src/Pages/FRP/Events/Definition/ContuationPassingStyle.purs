module Pages.FRP.Events.Definition.ContuationPassingStyle where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

contuationPassingStyle :: Subsection
contuationPassingStyle = subsection
  { title: "Contuation passing style"
  , matter: pure
      [ D.p_
          [ text_ ""
          ]
      ]
  }
