module Pages.FRP.Sampling.SamplingOnAnEvent.BiasingASideOfSampling where

import Prelude

import Components.Code (psCodeWithLink)
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
import FRP.Event.Class ((<**|>), (<*|>), (<|**>), (<|*>))

biasingASideOfSampling :: Subsection
biasingASideOfSampling = subsection
  { title: "Biasing a side of sampling"
  , matter: pure
      [ D.p_
          [ text "Even though "
          , D.code__ "sampleOnLeft"
          , text " and "
          , D.code__ "sampleOnRight"
          , text
              " control the temporality of which side to sample from, there's an important corner case to consider: when the events are \"cotemporal.\""
          ]
      , D.p_
          [ text
              "Of course, in the browser, nothing can happen truly simultaneously on the UI thread - there will always be a before/after relationship. But from the viewpoint of a program, things may "
          , D.i__ "seem"
          , text
              " cotemporal. The easiest way to see this is by using the same event as a source. Let's recreate both examples above using a "
          , D.i__ "single"
          , text " slider."
          ]
      , psCodeWithLink Examples.BiasingASideOfSampling
      , exampleBlockquote
          [ Deku.do
              setSlider /\ slider <- useState'
              fixed
                [ D.div [klass "flex justify-around"]
                    [ D.input [slider setSlider] [] ]
                , text
                    ( slider <|**>
                        ((\a b -> show b <> " " <> show a) <$> slider)
                    )
                , D.br_ []
                , text
                    ( slider <**|>
                        ((\a b -> show b <> " " <> show a) <$> slider)
                    )
                , D.br_ []
                , text
                    ( ((\a b -> show a <> " " <> show b) <$> slider) <|*> slider
                    )
                , D.br_ []
                , text
                    ( ((\a b -> show a <> " " <> show b) <$> slider) <*|> slider
                    )
                ]
          ]
      , D.p_
          [ text
              "As you move the slider, a curious situation appears on lines 2 and 4, "
          , D.i__ "n'est-ce pas?"
          , text
              " Even though the events are cotemporal, the second one lags after the first. What gives?"
          ]
      , D.p_
          [ text "In the browser, one thing "
          , D.i__ "always"
          , text
              " happens after another thing. Technically that's probably true about everything. But let's stick to the browser. In examples 1 and 3 we use left-biased operators, and in examples 2 and 4, we use right-biased operators. In "
          , D.code__ "purescript-hyrule"
          , text
              ", the left-biased operators always emit the left event first, which means that for cotemporal events, the left emits before the right. When we then use the right to control the timing, the left is hydrated with the most recent result."
          ]
      , D.p_
          [ text
              "On the other hand, the right-biased operators always emit the right value before the left one. So when we use the right to control the timing, the left does not have the most recent value yet and we perceive a lag."
          ]
      , D.p_
          [ text
              "So which one is better? You decide! The framework lets you opt into whichever behavior suites your needs."
          ]
      ]
  }
