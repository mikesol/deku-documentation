module Pages.CoreConcepts where

import Contracts (Chapter(..))
import Pages.CoreConcepts.Collections (collections)
import Pages.CoreConcepts.Components (components)
import Pages.CoreConcepts.Effects (effects)
import Pages.CoreConcepts.HelloWorld (helloWorld)
import Pages.CoreConcepts.MoreHooks (moreHooks)
import Pages.CoreConcepts.Portals (portals)
import Pages.CoreConcepts.Providers (providers)
import Pages.CoreConcepts.Pursx (pursx)
import Pages.CoreConcepts.State (state)

coreConcepts :: forall lock payload. Chapter lock payload
coreConcepts = Chapter
  { title: "Core concepts"
  , pages:
      [ helloWorld
      , components
      , state
      , pursx
      , collections
      , portals
      , providers
      , effects
      , moreHooks
      ]
  }