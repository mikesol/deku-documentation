module Pages.AdvancedUsage.SSR.RenderingAStaticSite.HowEffectsAreHandled where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

howEffectsAreHandled :: Subsection
howEffectsAreHandled = subsection
  { title: "How effects are handled"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.EffectsInSSR
      pure
        [ D.p_
            [ text
                "The Deku SSR engine is smart enough to drop all effectful elements like click listeners and all parts of the DOM that are created using effects, like for example an image that is only created when a click event occurs."
            ]
        , example

        ]
  }
