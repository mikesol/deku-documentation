module Pages.FRP.Filtering.Compact.CompactingEvents where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Data.Filterable (compact, filter)
import Data.Maybe (Maybe(..))
import Data.String.Utils (startsWith)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_, textInput, textInput_)
import FRP.Event (Event)

compactingEvents :: forall lock payload. Subsection lock payload
compactingEvents = subsection
  { title: "Compacting events"
  , matter: pure
      [ D.p_
          [ text_
              "Here's an example of using compact to \"turn off\" one slider in our application. We can think of the right slider as representing errors, and we write a higher-order function to turn it off via compact."
          ]
      , psCode
          """module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event)

main :: Effect Unit
main = runInBody Deku.do
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
    [ D.input (klass_ "mr-2" <|> slider_ setLeft) []
    , D.input (slider_ setRight) []
    , D.div_
        [ text_ "Responds to both channels: "
        , text (eventMaker identity identity identity <#> show)
        ]
    , D.div_
        [ text_ "Only responds to the left channel: "
        , text
            ( eventMaker compact (map Just) (const (pure Nothing))
                <#> show
            )
        ]
    ]"""
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
                [ D.input (klass_ "mr-2" <|> slider_ setLeft) []
                , D.input (slider_ setRight) []
                , D.div_
                    [ text_ "Responds to both channels: "
                    , text (eventMaker identity identity identity <#> show)
                    ]
                , D.div_
                    [ text_ "Only responds to the left channel: "
                    , text
                        ( eventMaker compact (map Just) (const (pure Nothing))
                            <#> show
                        )
                    ]
                ]
          ]
      ]
  }
