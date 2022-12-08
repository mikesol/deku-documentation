module Pages.FRP.Sampling.Gating.SwitchingOnBehaviors where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Control (text, text_)
import Deku.DOM as D
import Effect.Random (random)
import Examples as Examples
import FRP.Behavior (behavior, sample_, switcher)
import FRP.Event.Effect (bindToEffect)
import FRP.Event.Time (interval)

switchingOnBehaviors :: forall lock payload. Subsection lock payload
switchingOnBehaviors = subsection
  { title: "Switching on behaviors"
  , matter: pure
      [ D.p_
          [ text_
              "A close cousin of gating is switching, which alternates between behaviors based on an event. In the random number generator below, you'll see the distribution of the behavior shrink or expand via the switcher."
          ]
      , psCodeWithLink Examples.SwitchingOnBehaviors
      , exampleBlockquote
          [ do
              let
                b i = behavior
                  (\e -> bindToEffect e \f -> (f <<< mul i) <$> random)
              text
                ( show <$>
                    ( sample_
                        ( switcher (b 1.0)
                            ( interval 2000 <#> \i -> b
                                (((unwrap $ unInstant i) / 1000.0) % 1.0)
                            )
                        )
                        (interval 250)
                    )
                )
          ]
      ]
  }
