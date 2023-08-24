module Pages.FRP.Alternatives.Alt.PerformanceConsiderations where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

performanceConsiderations :: Subsection
performanceConsiderations = subsection
  { title: "Performance considerations"
  , matter: pure
      [ D.p_
          [ text_ "Because "
          , D.code__ "<|>"
          , text_
              " adds an extra thunk to your stack, too many of them can degrade performance. To aleviate this, you can make a hand-written version of "
          , D.code__ "oneOf"
          , text_
              " that only costs one thunk for an arbitrary number of events."
          ]
      , psCode
          """oneOf' :: forall a. Array (Event a) -> Event a
oneOf' a = makeLemmingEvent \s k -> do
  u <- traverse (flip s k) a
  pure (sequence_ u)"""
      ]
  }
