module Pages.CoreConcepts.Providers.RowPolymorphism where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Providers.RowPolymorphism.RowsAndRecordsInPureScript (rowsAndRecordsInPureScript)
import Pages.CoreConcepts.Providers.RowPolymorphism.DifferencesWithTraditionalPolymorphism (differencesWithTraditionalPolymorphism)
import Pages.CoreConcepts.Providers.RowPolymorphism.UsingTheUnderscore (usingTheUnderscore)

rowPolymorphism :: forall lock payload. Section lock payload
rowPolymorphism = section
  { title: "Row polymorphism"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Row polymorphism" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ rowsAndRecordsInPureScript
      , differencesWithTraditionalPolymorphism
      , usingTheUnderscore
      ]
  }
