module Pages.AdvancedUsage where


import Contracts (Chapter, chapter)
import Pages.AdvancedUsage.AccessingTheDOM (accessingTheDOM)
import Pages.AdvancedUsage.BuildingAndDeploying (buildingAndDeploying)
import Pages.AdvancedUsage.CustomElements (customElements)

advancedUsage :: Chapter
advancedUsage = chapter
  { title: "Advanced usage"
  , pages:
      [ customElements
      , accessingTheDOM
      , buildingAndDeploying
      ]
  }