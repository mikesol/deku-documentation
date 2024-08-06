module Pages.CoreConcepts.Components.AddingEventHandlers.UsingTheOriginalEvent where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

usingTheOriginalEvent :: Subsection
usingTheOriginalEvent = subsection
  { title: "Using the DOM event"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.UsingTheOriginalEvent
      pure
        [ D.p_
            [ text_
                "To use the original event emitted by the DOM, you can use the following syntax."
            ]
        , example
        ]
  }
