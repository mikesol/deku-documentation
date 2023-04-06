module Pages.CoreConcepts.Components.AddingAttributes.SeveralAttributes where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import QualifiedDo.Alt as Alt
import Deku.DOM as D

severalAttributes :: Subsection
severalAttributes = subsection
  { title: "Several attributes"
  , matter: pure

      [ D.p_
          [ text_ "Several attributes are specified by "
          , D.code_ [ text_ "alt" ]
          , text_ "-ing them together, meaning applying the "
          , D.code_ [ text_ "alt" ]
          , text_ " or "
          , D.code_ [ text_ "<|>" ]
          , text_
              " infix operator. Because no one likes lots of tie fighters, one can also write "
          , D.code_ [ text_ "oneOf" ]
          , text_ " followed by an array of attributes in order to "
          , D.code_ [ text_ "alt" ]
          , text_ " them together. Another nice snytax is "
          , D.code_ [ text_ "Alt.do" ]
          , text_ " from the "
          , D.a
              Alt.do
                D.Target !:= "_blank"
                D.Href !:=
                  "https://pursuit.purescript.org/packages/purescript-qualified-do/2.2.0/docs/QualifiedDo.Alt"
              [ D.code_ [ text_ "qualified-do" ] ]
          , text_
              " package. All of these methods do the same thing, and they're all shown below."
          ]
      , psCode
          """-- using alt
(D.Id !:= "my-id")
  `alt` (D.Style !:= "background-color:silver;")

-- using <|>
(D.Id !:= "my-id")
  <|> (D.Style !:= "background-color:silver;")

-- using oneOf
oneOf
  [ D.Id !:= "my-id"
  , D.Style !:= "background-color:silver;"
  ]

-- using Alt.do
Alt.do
  D.Id !:= "my-id"
  D.Style !:= "background-color:silver;"
"""
      ]
  }
