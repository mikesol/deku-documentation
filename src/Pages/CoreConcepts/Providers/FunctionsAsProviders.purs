module Pages.CoreConcepts.Providers.FunctionsAsProviders where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Providers.FunctionsAsProviders.MixingDoNotation (mixingDoNotation)
import Pages.CoreConcepts.Providers.FunctionsAsProviders.UsingFunctionsAsMonads (usingFunctionsAsMonads)

functionsAsProviders :: forall lock payload. Section lock payload
functionsAsProviders = section
  { title: "FunctionsAsProviders"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "FunctionsAsProviders"]
            , text_ "."
          ]
      ]
  , subsections:
      [ mixingDoNotation,usingFunctionsAsMonads]
  }
