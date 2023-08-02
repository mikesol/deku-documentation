module Examples.PurityOutOfThinAir where

import Prelude

import Control.Apply (lift2)
import Control.Plus (empty)
import Data.Array (intercalate)
import Data.Monoid.Endo (Endo(..))
import Data.Newtype (unwrap)
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (fold)
import FRP.Event.Time (interval)

main :: Effect Unit
main = do
  i0 <- interval 804
  i1 <- interval 1222
  i2 <- interval 568
  let endoS s = Endo (map (_ <> s))
  let endoE e = Endo (flip (lift2 (<>)) e)
  runInBody do
    let
      alternate e a b =
        map
          (if _ then a else b)
          (fold (pure <$> not) true e)
    text
      $ unwrap
          ( intercalate (endoS " ")
              [ endoE $ alternate i0.event "Functional" "Imperative"
              , endoS "programming"
              , endoE $ alternate i1.event "is" "isn't"
              , endoE $ alternate i2.event "fun!" "boring!"
              ]
          )
          empty