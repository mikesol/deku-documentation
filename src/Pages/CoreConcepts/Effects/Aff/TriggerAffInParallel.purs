module Pages.CoreConcepts.Effects.Aff.TriggerAffInParallel where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

triggerAffInParallel :: Subsection
triggerAffInParallel = subsection
  { title: "Making API calls"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.RunningAffsInResponseToAnEvent
      pure
        [ D.p_
            [ text_
                "In PureScript, asynchronous effects can be triggered by using ",
              D.code_ [D.text_ "launchAff"],
              text_ " in an effectful context like a click listener. This allows us to use the same flow from the timestamp example above and adapt it to asynchronous code."
            ]
        , example
        ]
  }
