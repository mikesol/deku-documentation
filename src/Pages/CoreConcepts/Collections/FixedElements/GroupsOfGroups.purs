module Pages.CoreConcepts.Collections.FixedElements.GroupsOfGroups where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

groupsOfGroups :: Subsection
groupsOfGroups = subsection
  { title: "Groups of groups"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.ComponentsAsMonoids
      pure
        [ D.p_
            [ text_ "Because "
            , D.code__ "fixed"
            , text
                " does not create a DOM element for its content, one may wonder how nested "
            , D.code__ "fixed"
            , text
                " calls are handled. In Deku, they are always flattened into the lower-most logical parent element. So if there is a fixed in a fixed in a fixed, the inner-most fixed has the same parent as the top-most fixed."
            ]
        , D.p_
            [ text_ "Here's an example of nested "
            , D.code__ "flatten"
            , text_ "s going into the same container element."
            ]
        , example
        , D.p_
            [ text_ "In this example, we see the use of "
            , D.code__ "useHot"
            , text_ " instead of "
            , D.code__ "useState"
            , text
                ". To understand why, think about the contract with the state variable "
            , D.code__ "badness"
            , text
                ". The UI responds to it by creating a new section and then this section starts listening to "
            , D.code__ "badness"
            , text_ ". But by the time it starts listening to "
            , D.code__ "badness"
            , text
                ", the click event has already fired, so the inner listener does not evaluate the statement "
            , D.code__ "(_ > Worse)"
            , text_ ". To provide the nested "
            , D.code__ "flatten"
            , text_ " with the most recent event, we use "
            , D.code__ "useHot"
            , text_ "."
            ]
        ]
  }
