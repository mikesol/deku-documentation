module Pages.CoreConcepts.Components.AddingAttributes.ASingleAttribute where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

aSingleAttribute :: Subsection
aSingleAttribute = subsection
  { title: "Setting attributes"
  , matter: pure
      [ D.p_
          [ text_ "Individual attributes are set with the "
          , D.code_ [ text_ ":=" ]
          , text_ " infix operator."
          ]
      , psCode
          "D.Style := \"color:teal;\""
      , D.p_
          [ text_
              "To feed an attribute to Deku, it needs to be in an array. Several attributes can be set by including them all in an array."
          ]
      , psCode
          """[ DA.id_ "my-id"
, DA.style_ "background-color:silver;"
]
"""
      ]
  }
