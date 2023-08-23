module Pages.AdvancedUsage.CustomElements.DefiningCustomElements.AddingCustomElementsToTheDOM where

import Prelude

import Contracts (CollapseState(..), getExample, Subsection, subsection)
import Data.Maybe (Maybe(..))
import Deku.DOM as D
import Examples as Examples

addingCustomElementsToTheDOM :: Subsection
addingCustomElementsToTheDOM = subsection
  { title: "Defining attributes"
  , matter: do
      example <- getExample StartExpanded Nothing Examples.AddingCustomElements
      pure
        [ D.p__
            "Things get more interesting when custom attributes are involved. By defining what attributes are settable for your custom element and how they should be marshaled into strings or listeners, you can create domain-specific logic for your DOM."
        , example
        ]
  }
