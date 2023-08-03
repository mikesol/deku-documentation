module Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

triggerAffWithCancellation
  :: Subsection
triggerAffWithCancellation = subsection
  { title: "The useAffWithCancellation hook"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.RunningAffsWithCancellationInResponseToAnEvent
      pure
        [ D.p_
            [ text
                "This variation does cancellation, so when a new aff comes down the pipe, the previous one is cancelled."
            ]
        , example
        ]
  }
