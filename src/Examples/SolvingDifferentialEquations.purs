module Examples.SolvingDifferentialEquations where

import Prelude

import Data.DateTime.Instant (unInstant)
import Data.Newtype (class Newtype, unwrap)
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (keepLatest)
import FRP.Event.AnimationFrame (animationFrame')
import FRP.Event.Time (withTime)
import FRP.Poll (sample, sham, solve2')

buttonClass :: String
buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6"""

newtype Fieldable = Fieldable (Number -> Number)

derive instance Newtype Fieldable _
derive newtype instance Semiring Fieldable
derive newtype instance Ring Fieldable
instance CommutativeRing Fieldable
instance EuclideanRing Fieldable where
  degree _ = 1
  div (Fieldable f) (Fieldable g) = Fieldable \x -> f x / g x
  mod _ _ = Fieldable \_ -> 0.0

instance DivisionRing Fieldable where
  recip (Fieldable f) = Fieldable \x -> 1.0 / f x

app :: ExampleSignature
app runExample = do
  af <- animationFrame' withTime
  runExample Deku.do
    let pfield = Fieldable <<< pure
    setThunk /\ thunk <- useState unit
    let
      motion = keepLatest $ thunk $>
        ( sham
            ( map show $ sample
                ( solve2' (pfield 1.0) (pfield 0.0)
                    (pure (Fieldable identity))
                    ( \x dx'dt -> pure (pfield (-0.5)) * x -
                        (pure (pfield 0.1)) * dx'dt
                    )
                )
                ( af.event <#>
                    _.time
                      >>> unInstant
                      >>> unwrap
                      >>> (_ / 1000.0)
                      >>> flip unwrap
                )
            )
        )
    D.div_
      [ D.div_
          [ D.button
              [ DA.klass_ buttonClass, DL.click_ \_ -> (setThunk unit) ]
              [ text_ "Restart simulation" ]
          ]
      , D.div_
          [ D.input
              [ DA.xtype_ "range"
              , DA.klass_ "w-full"
              , DA.min_ "-1.0"
              , DA.max_ "1.0"
              , DA.step_ "0.01"
              , DA.value motion
              ]
              []
          ]
      ]

main :: Effect Unit
main = void $ app runInBody