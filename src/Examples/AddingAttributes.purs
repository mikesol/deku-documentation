module Examples.AddingAttributes where

import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D

main :: ExampleSignature
main runExample = runExample
  ( D.div_
      [ D.span
          [ D.Style := "color:teal;" ]
          [ text "I exist" ]
      , D.ul_ $ map D.li__ [ "A", "B", "C" ]
      , D.div_
          [ D.h3
              [ D.Id := "my-id"
              , D.Style := "background-color:silver;"
              ]

              [ text "foo" ]
          , D.i [ klass "text-2xl" ] [ text "bar" ]
          , text " "
          , D.b__ "baz"
          ]
      ]
  )