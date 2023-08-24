module Pages.CoreConcepts.Pursx.DynamicElements.AddingSeveralElements where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

addingSeveralElements :: Subsection
addingSeveralElements = subsection
  { title: "Adding several DOM elements as a component"
  , matter: do
      example <- getExample StartExpanded Nothing
        Examples.AddingSeveralElementsToPursx
      pure
        [ D.p_
            [ text_ "To add several elements, one can use "
            , D.code__ "fixed"
            , text_ " or "
            , D.code__ "<>"
            , text_ "."
            ]
        , example
        ]
  }
