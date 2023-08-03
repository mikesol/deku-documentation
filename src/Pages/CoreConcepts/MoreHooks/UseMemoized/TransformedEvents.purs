module Pages.CoreConcepts.MoreHooks.UseMemoized.TransformedEvents where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

transformedEvents :: Subsection
transformedEvents = subsection
  { title: "The useMemoized hook"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.MemoizedApplication
      pure [ D.p_
          [ text
              "To make a more efficient version of the example above, we use the "
          , D.code__ "useMemoized"
          , text " hook."
          ]
      , example
      , D.p_
          [ text "Now, each subscription to "
          , D.code__ "composedEvent"
          , text " will draw from the "
          , D.i__ "same"
          , text
              " event. This can help avoid lag, especially when belaboring under the constraint of a rendering loop that needs to execute at 60fps."
          ]
      ]
  }
