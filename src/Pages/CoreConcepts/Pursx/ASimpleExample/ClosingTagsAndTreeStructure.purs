module Pages.CoreConcepts.Pursx.ASimpleExample.ClosingTagsAndTreeStructure where

import Prelude


import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

closingTagsAndTreeStructure :: forall lock payload. Subsection lock payload
closingTagsAndTreeStructure = subsection
  { title: "Closing tags and tree structure"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Closing tags and tree structure" ]
          , text_ "."
          ]
      ]
  }
