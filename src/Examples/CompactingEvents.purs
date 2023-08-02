module Examples.CompactingEvents where

import Prelude
import ExampleAssitant (ExampleSignature)

import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Maybe (Maybe(..))
import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider)

import FRP.Event (Event)

main :: ExampleSignature
main runExample = runExample Deku.do
  setLeft /\ left <- useState'
  setRight /\ right <- useState'
  let
    eventMaker
      :: forall b c
       . (Event b -> Event c)
      -> (Event Number -> Event b)
      -> (Event Number -> Event b)
      -> Event c
    eventMaker f l r = f (l left <|> r right)
  D.div_
    [ D.input ([ klass "mr-2" ] <> slider setLeft) []
    , D.input (slider setRight) []
    , D.div_
        [ text "Responds to both channels: "
        , text $ show <$> (50.0 :| (eventMaker identity identity identity))
        ]
    , D.div_
        [ text "Only responds to the left channel: "
        , text $ show <$>
            ( 50.0 :|
                (eventMaker compact (Just <$> _) (_ $> Nothing))
            )
        ]
    ]