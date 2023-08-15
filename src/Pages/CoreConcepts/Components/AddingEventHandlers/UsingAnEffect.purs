module Pages.CoreConcepts.Components.AddingEventHandlers.UsingAnEffect where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

usingAnEffect :: Subsection
usingAnEffect = subsection
  { title: "Using an effect"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.UsingAnEffect
      pure
        [ D.p_
          [ text_
              "The most straightforward event is that which triggers an effectful action, like an alert or an audio snippet."
          ]
      , example
      ]
  }
