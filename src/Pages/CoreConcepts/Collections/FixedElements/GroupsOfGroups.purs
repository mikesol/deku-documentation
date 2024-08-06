module Pages.CoreConcepts.Collections.FixedElements.GroupsOfGroups where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

groupsOfGroups :: Subsection
groupsOfGroups = subsection
  { title: "Guarding"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.GroupsOfGroups
      pure
        [ D.p_
            [ text_
                "In an array of components, sometimes you'd like one to disappear for a bit. Enter "
            , D.code__ "guard"
            , text_
                " which gates the presence or absence of an argument on a "
            , D.code__ "Boolean"
            , text_
                " condition derived from the state."
            ]
        , D.p_
            [ text_ "Here's an example of nested "
            , D.code__ "guard"
            , text_ "s going into the same container element."
            ]
        , example
        ]
  }
