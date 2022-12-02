module Pages.CoreConcepts.MoreHooks.UseMemoized.InitialEvents where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

initialEvents :: forall lock payload. Subsection lock payload
initialEvents = subsection
  { title: "Without an event"
  , matter: pure
      [ D.p_
          [ text_
              "In some cases, it does not make sense to have an initial event, for example if you're building a question-answer app that needs to perform a computation and compute the response. In this case, you can use "
          , D.code__ "useMemoized'", text_ ". This hook provides the opportunity to map over the internal event, and it is the result of the mapped computation that is memoized."
          ]
      ]
  }
