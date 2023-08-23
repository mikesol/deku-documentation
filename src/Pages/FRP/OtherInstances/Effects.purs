module Pages.FRP.OtherInstances.Effects where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.OtherInstances.Effects.BindToEffect (b2e)
import Pages.FRP.OtherInstances.Effects.Danke (danke)

effects :: Section
effects = section
  { title: "Effects"
  , topmatter: pure
      [ D.p_
          [ text_ "There are two functions you can use to hitch any ol' side effect onto an event. We've seen them used here and there in the docs already, but let's give them the long-overdue section that they deserve"
          ]
      ]
  , subsections:
      [ b2e, danke ]
  }
