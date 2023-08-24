module Pages.CoreConcepts.Effects.Aff.TriggerEffect where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

triggerEffect :: Subsection
triggerEffect = subsection
  { title: "A time-stamper"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.RunningEffectsInResponseToEvents
      pure [ D.p_
          [ text_ "In the example below, we mint a very-effectful fresh timestamp every time the text "
          , D.b__ "Current timestamp"
          , text_ " is clicked. The same pattern is accomplishable via "
          , D.code__ "useRef"
          , text_
              ". As is the case with many things in Deku, there is more than one way to skin a Gerudian Lizalfos."
          ]
      , example
      ]
  }
