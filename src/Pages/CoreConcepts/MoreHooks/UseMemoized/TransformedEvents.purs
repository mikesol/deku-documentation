module Pages.CoreConcepts.MoreHooks.UseMemoized.TransformedEvents where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

transformedEvents :: Subsection
transformedEvents = subsection
  { title: "The useRant hook"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.MemoizedApplication
      pure
        [ D.p_
            [ text_
                "To make a more efficient version of the example above, we use the "
            , D.code__ "useRant"
            , text_ " hook. Why is it called a "
            , D.i__ "rant"
            , text_
                "? Because it works off of a prefabbed script, aka the incoming,"
            , D.code__ "Poll"
            , text_
                ", not unlike a rant. This is subtly different than memoization (we’ll see why later) but for now, you can think of it like memoization."
            ]
        , example
        , D.p_
            [ text_ "Now, each subscription to "
            , D.code__ "composedEvent"
            , text_ " will draw from the "
            , D.i__ "same"
            , text_
                " event. This can help avoid lag, especially when belaboring under the constraint of a rendering loop that needs to execute at 60fps."
            ]
        ]
  }
