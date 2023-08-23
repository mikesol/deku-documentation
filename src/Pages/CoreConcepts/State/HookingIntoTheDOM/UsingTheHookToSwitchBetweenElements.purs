module Pages.CoreConcepts.State.HookingIntoTheDOM.UsingTheHookToSwitchBetweenElements where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

usingTheHookToSwitchBetweenElements
  :: Subsection
usingTheHookToSwitchBetweenElements = subsection
  { title: "Using a hook to switch between elements"
  , matter: do
      example <- getExample StartExpanded Nothing
        Examples.UsingTheHookToSwitchBetweenElements
      pure
        [ D.p_
            [ text_
                "You can also use a hook to switch between elements. This is particularly useful for tabbed navigation. In the example below, a hook is used to switch between an image, a video, and an SVG. This is accomplished via the "
            , D.code__ "<#~>"
            , text_ " operator."
            ]
        , example
        , D.p_
            [ text_
                "If your DOM is mostly static and has a few switching elements within it, consider using multiple "
            , D.code__ "<#~>"
            , text_ " operators instead of one global "
            , D.code__ "<#~>"
            , text_ ", as it will generally result in better performance."
            ]
        ]
  }
