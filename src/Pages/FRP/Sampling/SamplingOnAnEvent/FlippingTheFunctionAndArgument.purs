module Pages.FRP.Sampling.SamplingOnAnEvent.FlippingTheFunctionAndArgument where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

flippingTheFunctionAndArgument :: Subsection
flippingTheFunctionAndArgument = subsection
  { title: "Flipping the temporality"
  , matter: do
     example <- getExample StartCollapsed Nothing Examples.FlippingTheFunctionAndArgument
     pure
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
      , example
      ]
  }
