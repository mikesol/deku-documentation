module Pages.CoreConcepts.Providers.FunctionsAsProviders where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Providers.FunctionsAsProviders.PassingAroundHooks (passingAroundHooks)
import Pages.CoreConcepts.Providers.FunctionsAsProviders.UsingFunctionsAsMonads (usingFunctionsAsMonads)

functionsAsProviders :: Section
functionsAsProviders = section
  { title: "Functions as providers"
  , topmatter: pure
      [ D.p_
          [ text_
              "Providers are the beating heart of functional programming because \"what does a function do if not provide?\" Ok, so that's not an actual quote, I just made it up, and I know it looks awfully pretentious in quotes and all, but it's true, isn't it? The whole point of a function is to provide stuff to its innards and optionally produce a value. So a great way to have React-like contexts and providers in any functional language is to start from the "
          , D.b__ "function"
          , text_ "."
          ]
      ]
  , subsections:
      [ usingFunctionsAsMonads, {-mixingDoNotation,-} passingAroundHooks ]
  }
