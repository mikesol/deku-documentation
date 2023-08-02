module Pages.CoreConcepts.Components.AddingAttributes.SeveralAttributes where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

severalAttributes :: Subsection
severalAttributes = subsection
  { title: "Several attributes"
  , matter: pure

      [ D.p_
          [ text "Several attributes can be set by including them all in an array."
          ]
      , psCode
          """
[ D.Id := "my-id"
, D.Style := "background-color:silver;"
]
"""
      ]
  }
