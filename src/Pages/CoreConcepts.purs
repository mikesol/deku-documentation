module Pages.CoreConcepts where


import Contracts (Chapter, chapter)
import Pages.CoreConcepts.Collections (collections)
import Pages.CoreConcepts.Components (components)
import Pages.CoreConcepts.Effects (effects)
import Pages.CoreConcepts.MoreHooks (moreHooks)
import Pages.CoreConcepts.Portals (portals)
import Pages.CoreConcepts.Providers (providers)
import Pages.CoreConcepts.Pursx (pursx)
import Pages.CoreConcepts.State (state)

coreConcepts :: forall lock payload. Chapter lock payload
coreConcepts = chapter
  { title: "Core concepts"
  , pages:
      [ components
      , state
      , collections
      , pursx
      , portals
      , providers
      , effects
      , moreHooks
      ]
  }