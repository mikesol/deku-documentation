module Pages.CoreConcepts.Providers.RowPolymorphism where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Providers.RowPolymorphism.DifferencesWithTraditionalPolymorphism (differencesWithTraditionalPolymorphism)
import Pages.CoreConcepts.Providers.RowPolymorphism.RowsAndRecordsInPureScript (rowsAndRecordsInPureScript)
import Pages.CoreConcepts.Providers.RowPolymorphism.RowPolymorphismAndProviders (rowPolymorphismAndProviders)

rowPolymorphism :: Section
rowPolymorphism = section
  { title: "Row polymorphism"
  , topmatter: pure
      [ D.p_
          [ text_
              "As you build more and more Deku apps, you'll start to develop components that can be used across projects. You may find yourself building libraries, and these libraries will present APIs to consumers that require them to provide assets like auth tokens using the patterns described above."
          ]
      , D.p_
          [ text_
              "When writing a library, you won't have control over the PureScript types used in your consumers' applications, and you'll want to make it as convenient as possible for consumers to integrate with your service. In these cases, The Deku Way™, and dare I say The PureScript Way™, is to make liberal use of Row Polymorphism. This section is both a crash course in Row Polymorphism as well as some indications of how to use it as a Deku library builder."
          ]
      ]
  , subsections:
      [ rowsAndRecordsInPureScript
      , differencesWithTraditionalPolymorphism
      , rowPolymorphismAndProviders
      ]
  }
