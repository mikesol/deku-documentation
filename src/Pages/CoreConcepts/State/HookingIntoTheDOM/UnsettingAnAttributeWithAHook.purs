module Pages.CoreConcepts.State.HookingIntoTheDOM.UnsettingAnAttributeWithAHook where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

unsettingAnAttributeWithAHook :: Subsection
unsettingAnAttributeWithAHook = subsection
  { title: "Unsetting an attribute with a hook"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.UnsettingAttributes
      pure
        [ D.p_
            [ text_
                "Sometimes, you need to unset an attribute. You can do that by using the "
            , D.code__ "DL.unset"
            , text_ " combinator."
            ]
        , example
        , D.p_
            [ text_
                "Under the hood, unsetting an attribute calls the DOM's "
            , D.code__
                "removeAttribute"
            , text_
                " function, so it'll be as if the attribute were never there. What attribute? Exactly..."
            ]
        ]
  }
