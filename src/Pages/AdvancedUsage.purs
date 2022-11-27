module Pages.AdvancedUsage where

import Contracts (Chapter, chapter)
import Pages.AdvancedUsage.CustomElements (customElements)
import Pages.AdvancedUsage.SSR (sSR)

advancedUsage :: forall lock payload. Chapter lock payload
advancedUsage = chapter
  { title: "Advanced usage"
  , pages:
      [ customElements
      , sSR
      ]
  }