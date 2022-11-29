module Pages.CoreConcepts.Pursx.PursxAlternatives where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.PursxAlternatives.Html2deku (html2deku)
import Pages.CoreConcepts.Pursx.PursxAlternatives.UnsafePursx (unsafePursx)

pursxAlternatives :: forall lock payload. Section lock payload
pursxAlternatives = section
  { title: "Pursx alternatives"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Dynamic elements" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ unsafePursx, html2deku ]
  }
