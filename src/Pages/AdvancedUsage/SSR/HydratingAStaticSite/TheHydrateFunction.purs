module Pages.AdvancedUsage.SSR.HydratingAStaticSite.TheHydrateFunction where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

theHydrateFunction :: Subsection
theHydrateFunction = subsection
  { title: "The hydrate function"
  , matter: pure
      [ D.p_
          [ text_ "The "
          , D.code__ "hydrate"
          , text_ " function has the same signature as "
          , D.code__ "runInBody"
          , text
              " except that it expects a SSR-generated Deku site to already be present in the body. Here's an example of how that flow typically works (and by typically, I mean in the three known sites that use Deku SSR... soon to be four after you try it out!)."
          ]
      , psCode
          """-- MyApp.purs
-- some imports, then
myApp :: Nut
myApp = D.div_
  [ text_ "I can't believe they pay me to make these..." ]

-- SSR.purs
-- some imports, then
main :: Effect Unit
main = writeToFile (run (runSSR myApp))

-- LiveApp.purs
-- some imports, then
main :: Effect Unit
main = hydrate myApp
"""
      ]
  }
