module Pages.CoreConcepts.Providers.FunctionsAsProviders where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Providers.FunctionsAsProviders.MixingDoNotation (mixingDoNotation)
import Pages.CoreConcepts.Providers.FunctionsAsProviders.PassingAroundHooks (passingAroundHooks)
import Pages.CoreConcepts.Providers.FunctionsAsProviders.UsingFunctionsAsMonads (usingFunctionsAsMonads)

functionsAsProviders :: forall lock payload. Section lock payload
functionsAsProviders = section
  { title: "Functions as providers"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Functions as providers" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ usingFunctionsAsMonads, mixingDoNotation, passingAroundHooks ]
  }
