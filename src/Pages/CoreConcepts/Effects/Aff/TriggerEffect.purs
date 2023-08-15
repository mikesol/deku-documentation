module Pages.CoreConcepts.Effects.Aff.TriggerEffect where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

triggerEffect :: Subsection
triggerEffect = subsection
  { title: "The useEffect hook"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.RunningEffectsInResponseToEvents
      pure [ D.p_
          [ text
              "The "
          , D.code__ "useEffect"
          , text
              " hook allows us to trigger an arbitrary side effect whenever an event is emitted. In general, this is pretty safe. However, because side effects can have indefinitely-long asynchronous poll and trigger infinitely-many sub(sub(sub))-effects, you should use this with parsimony and restraint!"
          ]
      , D.p_
          [ text_ "In the example below, we use the "
          , D.code__ "useEffect"
          , text
              " hook to update a timestamp every time the text_ "
          , D.b__ "Current timestamp"
          , text_ " is clicked. The same pattern is accomplishable via "
          , D.code__ "useRef"
          , text
              ". As is the case with many things in Deku, there is more than one way to skin a Gerudian Lizalfos."
          ]
      , example
      ]
  }
