module Pages.CoreConcepts.Effects.Aff.TriggerAffWithCancellation where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

triggerAffWithCancellation
  :: Subsection
triggerAffWithCancellation = subsection
  { title: "Canceling stale API calls"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.RunningAffsWithCancellationInResponseToAnEvent
      pure
        [ D.p_
            [ text_
                "This variation of the code above does cancellation via the macabre "
            , D.code__ "killFiber"
            , text_
                ", so when a new aff comes down the pipe, the previous one is cancelled."
            ]
        , example
        ]
  }
