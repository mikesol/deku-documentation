module Pages.FRP.Alternatives.Alt.TheOneOfFunction where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Data.Foldable (oneOf)
import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import FRP.Event (delay)
import FRP.Event.Time (interval)

theOneOfFunction :: Subsection
theOneOfFunction = subsection
  { title: "The oneOf function"
  , matter: pure
      [ D.p_
          [ text_
              "Alting lots of events can get tedios. Too many tie fighters! To make life easier, there's the "
          , D.code__ "oneOf"
          , text_
              " function that will alt a bunch of events. Surveys consistently reveal that this is the technique most often used when coders create a text-only version of "
          , D.b__ "Harder, Better, Faster, Stronger"
          , text_ " in the browser."
          ]
      , psCodeWithLink Examples.TheOneOfFunction
      , exampleBlockquote
          [ do
              let
                ms = 967
                lyrics =
                  [ "Work it" /\ 0
                  , "Make it" /\ 1
                  , "Do it" /\ 2
                  , "Makes us" /\ 3
                  , "Harder" /\ 8
                  , "Better" /\ 9
                  , "Faster" /\ 10
                  , "Stronger" /\ 11
                  ]
                loop = 16 * ms
                beat (w /\ t) =
                  delay (t * ms) (pure w <|> (interval loop $> w))
              text (oneOf (beat <$> lyrics))
          ]
      ]
  }
