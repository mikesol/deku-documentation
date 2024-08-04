module Examples.IntegratingPolls where

import Prelude

import Data.DateTime.Instant (unInstant)
import Data.Newtype (class Newtype, unwrap)
import Data.Tuple.Nested ((/\))
import Deku.Control (text)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (sampleOnRight_)
import FRP.Event.AnimationFrame (animationFrame')
import FRP.Event.Time (withTime)
import FRP.Poll (integral', sample, sham)

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
  let pfield = Fieldable <<< pure
  runExample Deku.do
    setNumber /\ number <- useState 0.0
    D.div_
      [ D.div_
          [ D.input
              [ DA.xtypeRange
              , DL.numberOn_ DL.input setNumber
              , DA.klass_ "w-full"
              , DA.min_ "0.0"
              , DA.max_ "1.0"
              , DA.step_ "0.01"
              , DA.value_ "0.0"
              ]
              []
          ]
      , D.div_
          [ text
              ( sham
                  ( show <$>
                      ( ( sample
                            ( integral' (pfield 0.0)
                                (pure (Fieldable identity))
                                (pure >>> Fieldable <$> sampleOnRight_ number (sham af.event))
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
                  )
              )
          ]
      ]

main :: Effect Unit
main = void $ app runInBody