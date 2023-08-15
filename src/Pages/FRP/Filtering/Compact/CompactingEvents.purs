module Pages.FRP.Filtering.Compact.CompactingEvents where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

compactingEvents :: Subsection
compactingEvents = subsection
  { title: "Compacting events"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.CompactingEvents
      pure
        [ D.p_
            [ text_
                "Here's an example of using compact to \"turn off\" one slider in our application. We can think of the right slider as representing errors, and we write a higher-order function to turn it off via compact."
            ]
        , example
        ]
  }
