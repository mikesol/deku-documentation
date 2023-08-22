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
          [ text_ "Individual attributes like "
          , D.code_ [ text_ "style" ]
          , text_ " or "
          , D.code_ [ text_ "href" ]
          , text_ " are set with the "
          , D.code_ [ text_ "DA.style_" ]
          , text_ " or "
          , D.code_ [ text_ "DA.href_" ]
          , text_ " functions."
          ]
      , psCode
          "DA.style_ \"color:teal;\""
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
