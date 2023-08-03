module Pages.FRP.Alternatives.Alt.TheOneOfFunction where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

theOneOfFunction :: Subsection
theOneOfFunction = subsection
  { title: "The oneOf function"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.TheOneOfFunction
      pure [ D.p_
          [ text
              "Alting lots of events can get tedios. Too many tie fighters! To make life easier, there's the "
          , D.code__ "oneOf"
          , text
              " function that will alt a bunch of events. Surveys consistently reveal that this is the technique most often used when coders create a text-only version of "
          , D.b__ "Harder, Better, Faster, Stronger"
          , text " in the browser."
          ]
      , example
      ]
  }
