module Pages.CoreConcepts.Pursx.DynamicElements.AddingASingleElement where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

addingASingleElement :: Subsection
addingASingleElement = subsection
  { title: "Adding a single DOM element as a component"
  , matter: do
      example <- getExample StartExpanded Nothing Examples.AddingASingleElementToPursx
      pure[ D.p_
          [ text_
              "One natural case for adding elements to Pursx is when dealing with components that are easy to group together. For example, we can rewrite our breadcrumbs example to reuse the "
          , D.code__ "li"
          , text_ " element."
          ]
      , example
      , D.p_
          [ text_
              "To add an element dynamically, we use the same method as adding a dynamic attribute. Just place it between tildes wherever you need it!"
          ]

      ]
  }
