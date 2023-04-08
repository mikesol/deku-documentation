module Pages.CoreConcepts.Components.AddingAttributes.SeveralAttributes where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

severalAttributes :: Subsection
severalAttributes = subsection
  { title: "Several attributes"
  , matter: pure

      [ D.p_
          [ text_ "Several attributes can be set by including them all in an array."
          ]
      , psCode
          """
[ D.Id !:= "my-id"
, D.Style !:= "background-color:silver;"
]
"""
      ]
  }
