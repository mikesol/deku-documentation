module Pages.FRP.Sampling.SamplingOnAnEvent.FlippingTheFunctionAndArgument where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

flippingTheFunctionAndArgument :: Subsection
flippingTheFunctionAndArgument = subsection
  { title: "Flipping the temporality"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.FlippingTheFunctionAndArgument
      pure
        [ D.p_
            [ text_ "We can flip which event controls time by using "
            , D.code__ "sampleOnLeft"
            , text_ " aka "
            , D.code__ "<**|>"
            , text_ ". The signature is the same as "
            , D.code__ "sampleOnRight"
            , text_ ", namely:"
            ]
        , psCode
            """sampleOnLeft :: forall a b. event a -> event (a -> b) -> event b"""

        , D.p__
            "The example below is the same as the one above save time control - now, the slider on the left controls time. Make sure to move the slider on the right at least once to capture a value!."
        , example
        ]
  }
