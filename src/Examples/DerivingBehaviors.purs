module Examples.DerivingBehaviors where

import Prelude

import Data.Array (drop, length, null)
import Data.Foldable (oneOf, sum)
import Data.Int (toNumber)
import Data.Number (isNaN)
import Data.Time.Duration (Seconds(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (derivative', sample_, step)
import FRP.Behavior.Time (seconds)
import FRP.Event (fold)
import FRP.Event.AnimationFrame (animationFrame)

main :: Effect Unit
main = runInBody Deku.do
  setNumber /\ number <- useState 0.5
  let
    average l
      | null l = 0.0
      | otherwise = sum l / (toNumber $ length l)
    unNaN n = if isNaN n then 0.0 else n
  D.div_
    [ D.div_
        [ D.input
            ( oneOf
                [ slider_ setNumber
                , klass_ "w-full"
                , D.Min !:= "0.0"
                , D.Max !:= "1.0"
                , D.Step !:= "0.01"
                , D.Value !:= "0.5"
                ]
            )
            []
        ]
    , D.div_
        [ text
            ( average >>> unNaN >>> show <$>
                ( fold
                    ( \b a ->
                        if length b < 10 then b <> [ a ]
                        else (drop 1 b) <> [ a ]
                    )
                    []
                    ( sample_
                        ( derivative'
                            (seconds <#> (\(Seconds s) -> s))
                            (step 0.5 number)
                        )
                        animationFrame
                    )
                )
            )
        ]
    ]