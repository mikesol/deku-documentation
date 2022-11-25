module Pages.AdvancedUsage where

import Contracts (Chapter(..))
import Pages.AdvancedUsage.CustomElements (customElements)
import Pages.AdvancedUsage.SSR (sSR)


advancedUsage :: forall lock payload. Chapter lock payload
advancedUsage = Chapter
  { title: "Advanced usage"
  , pages:
      [ customElements
      , sSR
      ]
  }