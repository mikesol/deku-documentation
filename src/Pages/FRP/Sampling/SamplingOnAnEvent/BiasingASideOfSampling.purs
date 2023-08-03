module Pages.FRP.Sampling.SamplingOnAnEvent.BiasingASideOfSampling where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

biasingASideOfSampling :: Subsection
biasingASideOfSampling = subsection
  { title: "Biasing a side of sampling"
  , matter: do
     example <- getExample StartCollapsed Nothing Examples.BiasingASideOfSampling
     pure
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
      , example
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
