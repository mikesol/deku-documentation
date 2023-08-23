module Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnInitialization where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

effectsOnInitialization :: Subsection
effectsOnInitialization = subsection
  { title: "Creating our effect system"
  , matter: do
      example <- getExample StartExpanded Nothing Examples.Game
      pure
        [ D.p_
            [ text_
                "Let's create a little game where a bunch of svg sprites move across the screen. Click them before they turn red to score points! If they turn red, you lose a point. Try not to dip below 0!"
            ]
        , example
        ]
  }
