module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelfT where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

knowThySelfT :: Subsection
knowThySelfT = subsection
  { title: "Know thy SelfT"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.KnowThySelfT
      pure
        [ D.p_
            [ text_ "Certain elements, like "
            , D.code__ "input"
            , text_ " and "
            , D.code__ "button"
            , text_ " classes, have a strongly-typed variant of "
            , D.code__ "Self"
            , text_ " called "
            , D.code__ "SelfT"
            , text
                " that makes it a bit easier to work with the element using PureScript's DOM APIs."
            ]
        , example
        ]
  }
