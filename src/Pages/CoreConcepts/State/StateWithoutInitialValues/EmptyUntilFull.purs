module Pages.CoreConcepts.State.StateWithoutInitialValues.EmptyUntilFull where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.DOM as D
import Examples as Examples

emptyUntilFull :: Subsection
emptyUntilFull = subsection
  { title: "Empty until full"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.EmptyUntilFull
      pure
        [ D.p__
            "Let's revisit the first example from this section, using an uninitialized state."
        , example
        , D.p__
            "The only difference with the initial example is that the text element is rendered to the DOM after the first value has been provided."
        ]
  }
