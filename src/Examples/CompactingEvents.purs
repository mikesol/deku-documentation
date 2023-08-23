module Examples.CompactingEvents where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (Poll)

app :: ExampleSignature
app runExample = runExample.t Deku.do
  setLeft /\ left <- useState 50.0
  setRight /\ right <- useState 50.0
  let
    eventMaker
      :: forall b c
       . (Poll b -> Poll c)
      -> (Poll Number -> Poll b)
      -> (Poll Number -> Poll b)
      -> Poll c
    eventMaker f l r = f (l left <|> r right)
  D.div_
    [ D.input [ DA.klass_ "mr-2", DA.xtypeRange, DL.numberOn_ DL.input setLeft ]
        []
    , D.input [ DA.xtypeRange, DL.numberOn_ DL.input setRight ] []
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

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }