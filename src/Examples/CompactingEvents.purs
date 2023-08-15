module Examples.CompactingEvents where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Maybe (Maybe(..))
import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider)

import FRP.Poll (Poll)

app :: ExampleSignature
app runExample = runExample Deku.do
  setLeft /\ left <- useState'
  setRight /\ right <- useState'
  let
    eventMaker
      :: forall b c
       . (Poll b -> Poll c)
      -> (Poll Number -> Poll b)
      -> (Poll Number -> Poll b)
      -> Poll c
    eventMaker f l r = f (l left <|> r right)
  D.div_
    [ D.input [ klass_ "mr-2", slider_ setLeft ] []
    , D.input [slider setRight] []
    , D.div_
        [ text_ "Responds to both channels: "
        , text $ show <$> (50.0 :| (eventMaker identity identity identity))
        ]
    , D.div_
        [ text_ "Only responds to the left channel: "
        , text $ show <$>
            ( 50.0 :|
                (eventMaker compact (Just <$> _) (_ $> Nothing))
            )
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')