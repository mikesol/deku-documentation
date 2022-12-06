module Pages.FRP.Sampling.SamplingOnAnEvent.BiasingASideOfSampling where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.Control (text_)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider_)
import FRP.Event.Class ((<**|>), (<*|>), (<|**>), (<|*>))

example :: String
example =
  """module Main where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event.Class ((<|**>), (<|*>), (<**|>), (<*|>))

main :: Effect Unit
main = runInBody Deku.do
  setSlider /\ slider <- useState'
  fixed
    [ D.div (klass_ "flex justify-around")
        [ D.input (slider_ setSlider) [] ]
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
        ( ((\a b -> show a <> " " <> show b) <$> slider)
            <|*> slider
        )
    , D.br_ []
    , text
        ( ((\a b -> show a <> " " <> show b) <$> slider)
            <*|> slider
        )
    ]
"""

biasingASideOfSampling :: forall lock payload. Subsection lock payload
biasingASideOfSampling = subsection
  { title: "Biasing a side of sampling"
  , matter: pure
      [ D.p_
          [ text_ "Even though "
          , D.code__ "sampleOnLeft"
          , text_ " and "
          , D.code__ "sampleOnRight"
          , text_
              " control the temporality of which side to sample from, there's an important corner case to consider: when the events are \"cotemporal.\""
          ]
      , D.p_
          [ text_
              "Of course, in the browser, nothing can happen truly simultaneously on the UI thread - there will always be a before/after relationship. But from the viewpoint of a program, things may "
          , D.i__ "seem"
          , text_
              " cotemporal. The easiest way to see this is by using the same event as a source. Let's recreate both examples above using a "
          , D.i__ "single"
          , text_ " slider."
          ]
      , psCode example
      , exampleBlockquote
          [ Deku.do
              setSlider /\ slider <- useState'
              fixed
                [ D.div (klass_ "flex justify-around")
                    [ D.input (slider_ setSlider) [] ]
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
          [ text_
              "As you move the slider, a curious situation appears on lines 2 and 4, "
          , D.i__ "n'est-ce pas?"
          , text_
              " Even though the events are cotemporal, the second one lags after the first. What gives?"
          ]
      , D.p_
          [ text_ "In the browser, one thing "
          , D.i__ "always"
          , text_
              " happens after another thing. Technically that's probably true about everything. But let's stick to the browser. In examples 1 and 3 we use left-biased operators, and in examples 2 and 4, we use right-biased operators. In "
          , D.code__ "purescript-hyrule"
          , text_
              ", the left-biased operators always emit the left event first, which means that for cotemporal events, the left emits before the right. When we then use the right to control the timing, the left is hydrated with the most recent result."
          ]
      , D.p_
          [ text_
              "On the other hand, the right-biased operators always emit the right value before the left one. So when we use the right to control the timing, the left does not have the most recent value yet and we perceive a lag."
          ]
      , D.p_
          [ text_
              "So which one is better? You decide! The framework lets you opt into whichever behavior suites your needs."
          ]
      ]
  }
