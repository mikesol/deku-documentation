module Pages.FRP.OtherInstances.Monoid.EventsAsMonoids where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Monoid.Additive (Additive)
import Data.Monoid.Multiplicative (Multiplicative)
import Deku.Attribute ((!:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import FRP.Event (Event)

eventsAsMonoids :: forall lock payload. Subsection lock payload
eventsAsMonoids = subsection
  { title: "Events as monoids"
  , matter: pure
      [ D.p_
          [ text_
              "We can take a walk down monad lane using monoidal events with minimal mapping!"
          ]
      , psCode
          """module Main where

import Prelude

import Data.Monoid.Additive (Additive)
import Data.Monoid.Multiplicative (Multiplicative)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event)

main :: Effect Unit
main = runInBody do
  D.div_
    [ D.div_ [ text (show <$> (mempty :: Event (Additive Int))) ]
    , D.div_
        [ text (show <$> (mempty :: Event (Multiplicative Int))) ]
    , D.div_ [ text (show <$> (mempty :: Event Unit)) ]
    ]"""
      , exampleBlockquote
          [ D.div_
              [ D.div_ [ text (show <$> (mempty :: Event (Additive Int))) ]
              , D.div_
                  [ text (show <$> (mempty :: Event (Multiplicative Int))) ]
              , D.div_ [ text (show <$> (mempty :: Event Unit)) ]
              ]
          ]
      ]
  }
