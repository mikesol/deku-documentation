module Pages.FRP.OtherInstances.Monoid.EventsAsMonoids where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Monoid.Additive (Additive)
import Data.Monoid.Multiplicative (Multiplicative)
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import FRP.Event (Event)

eventsAsMonoids :: forall lock payload. Subsection lock payload
eventsAsMonoids = subsection
  { title: "Events as monoids"
  , matter: pure
      [ D.p_
          [ text_
              "We can take a walk down monad lane using monoidal events with minimal mapping!"
          ]
      , psCodeWithLink Examples.EventsAsMonoids
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
