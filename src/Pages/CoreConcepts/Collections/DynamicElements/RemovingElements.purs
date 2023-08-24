module Pages.CoreConcepts.Collections.DynamicElements.RemovingElements where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

removingElements :: Subsection
removingElements = subsection
  { title: "Removing elements"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.RemovingElements
      pure
        [ D.p_
            [ text_ "The "
            , D.code__ "useDyn"
            , text_
                " hook can be destructured to get a "
            , D.code__ "remove"
            , text_
                " effect that removes the component from the collection."
            ]
        , example
        ]
  }
