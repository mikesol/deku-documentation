module Pages.FRP.Sampling.SamplingOnAnEvent.FlippingTheFunctionAndArgument where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider)
import Examples as Examples
import FRP.Event.Class ((<**|>))

flippingTheFunctionAndArgument :: Subsection
flippingTheFunctionAndArgument = subsection
  { title: "Flipping the temporality"
  , matter: pure
      [ D.p_
          [ text "We can flip which event controls time by using "
          , D.code__ "sampleOnLeft"
          , text " aka "
          , D.code__ "<**|>"
          , text ". The signature is the same as "
          , D.code__ "sampleOnRight"
          , text ", namely:"
          ]
      , psCode
          """sampleOnLeft :: forall a b. event a -> event (a -> b) -> event b"""

      , D.p__
          "The example below is the same as the one above save time control - now, the slider on the left controls time. Make sure to move the slider on the right at least once to capture a value!."
      , psCodeWithLink Examples.FlippingTheFunctionAndArgument
      , exampleBlockquote
          [ Deku.do
              setSlider1 /\ slider1 <- useState'
              setSlider2 /\ slider2 <- useState'
              fixed
                [ D.div [ klass "flex justify-around" ]
                    [ D.input [ slider setSlider1 ] []
                    , D.input [ slider setSlider2 ] []
                    ]
                , text
                    ( slider1 <**|>
                        ((\a b -> show b <> " " <> show a) <$> slider2)
                    )
                ]
          ]
      ]
  }
