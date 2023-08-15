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
            [ text
                "Sometimes, you need to unset an attribute. You can do that by setting the attribute to "
            , D.code__ "unit"
            , text_ " via your hook."
            ]
        , example
        , D.p_
            [ text
                "Under the hood, unsetting an attribute calls the DOM's "
            , D.code__
                "removeAttribute"
            , text
                " function, so it'll be as if the attribute were never there. What attribute? Exactly..."
            ]
        ]
  }
