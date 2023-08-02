module Pages.CoreConcepts.Pursx.PursxAlternatives where

import Prelude

import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.PursxAlternatives.Html2deku (html2deku)
import Pages.CoreConcepts.Pursx.PursxAlternatives.UnsafePursx (unsafePursx)

pursxAlternatives :: Section
pursxAlternatives = section
  { title: "Pursx alternatives"
  , topmatter: pure
      [ D.p_
          [ text
              "Pursx is great, but sometimes, you need a little more juice. This section shows two alternative methods to achieve similar results."
          ]
      ]
  , subsections:
      [ unsafePursx, html2deku ]
  }
