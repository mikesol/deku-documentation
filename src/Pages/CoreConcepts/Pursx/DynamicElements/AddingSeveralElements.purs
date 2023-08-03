module Pages.CoreConcepts.Pursx.DynamicElements.AddingSeveralElements where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

addingSeveralElements :: Subsection
addingSeveralElements = subsection
  { title: "Adding several DOM elements as a component"
  , matter: do
      example <- getExample StartExapanded Nothing
        Examples.AddingSeveralElementsToPursx
      pure
        [ D.p_
            [ text "To add several elements, one can use "
            , D.code__ "fixed"
            , text " or "
            , D.code__ "<>"
            , text "."
            ]
        , example
        ]
  }
