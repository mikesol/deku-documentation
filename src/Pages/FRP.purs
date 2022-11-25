module Pages.FRP where

import Contracts (Chapter(..))
import Pages.FRP.Alternatives (alternatives)
import Pages.FRP.Applicatives (applicatives)
import Pages.FRP.Behaviors (behaviors)
import Pages.FRP.Busses (busses)
import Pages.FRP.Delegates (delegates)
import Pages.FRP.Events (events)
import Pages.FRP.Filtering (filtering)
import Pages.FRP.FixAndFold (fixAndFold)
import Pages.FRP.Sampling (sampling)


frp :: forall lock payload. Chapter lock payload
frp = Chapter
  { title: "Functional reactive programming"
  , pages:
      [ events
      , applicatives
      , alternatives
      , filtering
      , sampling
      , delegates
      , busses
      , fixAndFold
      , behaviors
      ]
  }