module Pages.CoreConcepts.MoreHooks.CustomHooks.NestedHooks where

import Prelude

import Data.Maybe (Maybe(..))
import Contracts (Subsection, getExample, CollapseState(..), subsection)
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

nestedHooks :: Subsection
nestedHooks = subsection
  { title: "Deku dos and nested hooks"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.NestedCustomHooks
      pure [ D.p_
          [ text
              "What fun would custom hooks be if they couldn't nest other hooks? When nesting hooks, "
          , D.code__ "Deku.do"
          , text_ " is your friend."
          ]
      , example
      ]
  }
