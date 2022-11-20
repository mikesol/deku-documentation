module Pages.CoreConcepts.Pursx.ASimpleExample where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Pursx.ASimpleExample.ClosingTagsAndTreeStructure (closingTagsAndTreeStructure)
import Pages.CoreConcepts.Pursx.ASimpleExample.PlainOldHTML (plainOldHTML)
import Pages.CoreConcepts.Pursx.ASimpleExample.TypeSafety (typeSafety)

aSimpleExample :: forall lock payload. Section lock payload
aSimpleExample = section
  { title: "ASimpleExample"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "ASimpleExample"]
            , text_ "."
          ]
      ]
  , subsections:
      [ closingTagsAndTreeStructure,plainOldHTML,typeSafety]
  }
