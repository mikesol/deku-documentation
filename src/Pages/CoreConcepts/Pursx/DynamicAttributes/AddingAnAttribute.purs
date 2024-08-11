module Pages.CoreConcepts.Pursx.DynamicAttributes.AddingAnAttribute where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

addingAnAttribute :: Subsection
addingAnAttribute = subsection
  { title: "Adding an attribute"
  , matter: do
      example <- getExample StartExpanded Nothing
        Examples.AddingAnAttributeToPursx
      pure
        [ D.p__
            "First, let's add a single listener that sets the breadcrumbs' visibiltiy based on interactions with an anchor tag. Here's the code."
        , example
        , D.p_
            [ text_
                "To specify an attribute in Pursx, we pick an identifier for the attribute and enclose it in tildes. For example, the attribute for the "
            , D.b__ "Project Nero"
            , text_ " list element is "
            , D.code__ "~neroHidden~"
            , text_
                ". Then, when creating the Pursx, we add a field to the record with the name of that identifier followed by whatever attribute we wish to add. In this case, we’re adding a class that hides or shows the breadcrumb."
            ]
        ]

  }
