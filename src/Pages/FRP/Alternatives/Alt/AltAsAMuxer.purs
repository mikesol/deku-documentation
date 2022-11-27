module Pages.FRP.Alternatives.Alt.AltAsAMuxer where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

altAsAMuxer :: forall lock payload. Subsection lock payload
altAsAMuxer = subsection
  { title: "Alt as a muxer"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Alt as a muxer" ]
          , text_ "."
          ]
      ]
  }
