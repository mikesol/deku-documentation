module Pages.FRP.Filtering.Compact.CompactingEvents where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider)
import Examples as Examples
import FRP.Event (Event)

compactingEvents :: Subsection
compactingEvents = subsection
  { title: "Compacting events"
  , matter: pure
      [ D.p_
          [ text
              "Here's an example of using compact to \"turn off\" one slider in our application. We can think of the right slider as representing errors, and we write a higher-order function to turn it off via compact."
          ]
      , psCodeWithLink Examples.CompactingEvents
      , exampleBlockquote
          [ Deku.do
              setLeft /\ left <- useState 50.0
              setRight /\ right <- useState 50.0
              let
                eventMaker
                  :: forall b c
                   . (Event b -> Event c)
                  -> (Event Number -> Event b)
                  -> (Event Number -> Event b)
                  -> Event c
                eventMaker f l r = f (l left <|> r right)
              D.div_
                [ D.input [klass "mr-2", slider setLeft] []
                , D.input [slider setRight] []
                , D.div_
                    [ text "Responds to both channels: "
                    , text (eventMaker identity identity identity <#> show)
                    ]
                , D.div_
                    [ text "Only responds to the left channel: "
                    , text
                        ( eventMaker compact (map Just) (const (pure Nothing))
                            <#> show
                        )
                    ]
                ]
          ]
      ]
  }
