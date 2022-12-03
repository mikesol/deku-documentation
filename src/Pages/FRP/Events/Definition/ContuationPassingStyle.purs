module Pages.FRP.Events.Definition.ContuationPassingStyle where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

contuationPassingStyle :: forall lock payload. Subsection lock payload
contuationPassingStyle = subsection
  { title: "Contuation passing style"
  , matter: pure
      [ D.p_
          [ text_ ""
          ]
      ]
  }
