module Pages.FRP.Alternatives.Plus.Emptiness where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

emptiness :: Subsection
emptiness = subsection
  { title: "Emptiness"
  , matter: pure
      [ D.p_
          [ text "The empty event is none other than:"
          ]
      , psCode "makeLemmingEvent \\_ _ -> pure (pure unit)"
      , D.p_
          [ text
              "It just ignores its inputs entirey and returns a no-op unsubscribe."
          ]
      ]
  }
