module Pages.CoreConcepts.Pursx.ASimpleExample.ClosingTagsAndTreeStructure where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

closingTagsAndTreeStructure :: forall lock payload. Subsection lock payload
closingTagsAndTreeStructure = subsection
  { title: "Closing tags and tree structure"
  , matter: pure
      [ D.p_
          [ text_
              "The Pursx parser gets better all the time, but it does have some limitations to be aware of. Even though "
          , D.code__ "<br>"
          , text_
              " is perfectly valid HTML5, the Pursx parser does not recognize it yet. Instead, you will have to write "
          , D.code__ "<br />"
          , text_
              ". Tools like Dreamweaver trailing slashes as a default, but you may need to run your HTML through a formatter if they're not present."
          ]
      , D.p_
          [ text_ "At the moment, Pursx only supports a single element. If you have multiple elements, make sure to wrap them in a "
          , D.code__ "div"
          , text_
              " or another suitable container. In the future, we may ease this requirement in order to support a series of elements."
          ]
      ]
  }
