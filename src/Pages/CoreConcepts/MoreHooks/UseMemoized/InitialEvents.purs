module Pages.CoreConcepts.MoreHooks.UseMemoized.InitialEvents where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

initialEvents :: Subsection
initialEvents = subsection
  { title: "Memoizing without an initial event"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.MemoizedNoEvent
      pure [ D.p_
          [ text_
              "Sometimes, it does not make sense to have an initial event, for example if you're building a question-answer app that needs to perform a computation and compute the response. In these cases, you can use "
          , D.code__ "useMemoized'"
          , text_
              ". This hook provides the opportunity to map over the internal event, and it is the result of the mapped computation that is memoized."
          ]
      , D.p__
          "In the example below, this method is used to memoize a squaring operation so that the result is computed only once."
      , example
      ]
  }
