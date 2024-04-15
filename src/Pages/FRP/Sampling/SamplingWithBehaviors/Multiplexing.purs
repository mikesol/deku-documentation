module Pages.FRP.Sampling.SamplingWithPolls.Multiplexing where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Env(..), Subsection, getEnv, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

multiplexing :: Subsection
multiplexing = subsection
  { title: "Gating events on polls"
  , matter: do
      Env { routeLink } <- getEnv
      example <- getExample StartExpanded Nothing Examples.Multiplexing
      pure
        [ D.p_
            [ D.span__
                "The "
            , D.code__ "hyrule"
            , D.span__
                " library has several helpful combinators for building effect systems at the boundaries of your application. One of them is "
            , D.code__ "withMultiplexing"
            , D.span__
                ", which allows you to mix several combinators. Rather than using it from the library, we'll define it inline just so you can see how short these combinators can be. The idea is that, as you get more comfortable with them, you can roll your own for fun and profit! But mostly profit."
            ]
        , example
        ]
  }
