module Pages.CoreConcepts.Providers.RowPolymorphism.DifferencesWithTraditionalPolymorphism where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

differencesWithTraditionalPolymorphism
  :: forall lock payload. Subsection lock payload
differencesWithTraditionalPolymorphism = subsection
  { title: "Differences with traditional polymorphism"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold")
              [ text_ "Differences with traditional polymorphism" ]
          , text_ "."
          ]
      ]
  }
