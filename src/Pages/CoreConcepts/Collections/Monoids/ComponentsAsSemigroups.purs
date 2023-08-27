module Pages.CoreConcepts.Collections.Monoids.ComponentsAsSemigroups where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

componentsAsSemigroups :: Subsection
componentsAsSemigroups = subsection
  { title: "Components as semigroups"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.ComponentsAsSemigroups
      pure
        [ D.p_
            [ text_
                "Components can be appended together, and the result will be a component. This is the same as enclosing all of the components in a "
            , D.code__ "fixed"
            , text_
                " bloc. Let's see this in action with George Sand's famous letter to Alfred de Musset."
            ]
        , example
        ]
  }
