module Examples.EventsAsMonoids where

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
    ]