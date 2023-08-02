module Pages.CoreConcepts.Pursx.ASimpleExample.ClosingTagsAndTreeStructure where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

closingTagsAndTreeStructure :: Subsection
closingTagsAndTreeStructure = subsection
  { title: "Closing tags and tree structure"
  , matter: pure
      [ D.p_
          [ text
              "The Pursx parser gets better all the time, but it does have some limitations. Even though "
          , D.code__ "<br>"
          , text
              " is perfectly valid HTML5, the Pursx parser does not recognize it yet. Instead, you will have to write "
          , D.code__ "<br />"
          , text
              ". Tools like Dreamweaver emit trailing slashes as a default, but you may need to run your HTML through a formatter if these slashes are not present."
          ]
      , D.p_
          [ text
              "At the moment, Pursx needs to be in a single enclosing element. If you have multiple elements, make sure to wrap them in a "
          , D.code__ "div"
          , text
              " or another suitable container. In the future, we may ease this requirement in order to support a list of elements."
          ]
      ]
  }
