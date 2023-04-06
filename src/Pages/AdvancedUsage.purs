module Pages.AdvancedUsage where

import Prelude

import Contracts (Chapter, chapter)
import Pages.AdvancedUsage.AccessingTheDOM (accessingTheDOM)
import Pages.AdvancedUsage.CustomElements (customElements)
import Pages.AdvancedUsage.SSR (sSR)

advancedUsage :: Chapter
advancedUsage = chapter
  { title: "Advanced usage"
  , pages:
      [ customElements
      , accessingTheDOM
      , sSR
      ]
  }