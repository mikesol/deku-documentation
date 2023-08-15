module Pages.CoreConcepts.Effects.Aff.TriggerAffInParallel where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

triggerAffInParallel :: Subsection
triggerAffInParallel = subsection
  { title: "The useAff hook"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.RunningAffsInResponseToAnEvent
      pure
        [ D.p_
            [ text
                "Use this hook to trigger affs without preserving order. This will keep your UI snappier but things may arrive out of order!"
            ]
        , example
        ]
  }
