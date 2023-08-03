module Pages.CoreConcepts.Collections.DynamicElements.MovingElements where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import Data.Maybe (Maybe(..))

movingElements :: Subsection
movingElements = subsection
  { title: "Moving elements"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.MovingElements
      pure
        [ D.p_
            [ text
                "The "
            , D.code__ "useDyn"
            , text
                " hook can be destructured to get some useful methods. In this section, we'll see how the "
            , D.code__ "sendTo"
            , text
                " function moves an element of a dynamic list to a different position."
            ]
        , example
        , D.p_
            [ text
                "If the chosen position is larger than the length of the list, the element will be sent to the end."
            ]
        ]
  }
