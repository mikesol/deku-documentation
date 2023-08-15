module Examples.AddingAttributes where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D

app :: ExampleSignature
app runExample = runExample
  ( D.div_
      [ D.span
          [ D.Style !:= "color:teal;" ]
          [ text_ "I exist" ]
      , D.ul_ $ map D.li__ [ "A", "B", "C" ]
      , D.div_
          [ D.h3
              [ D.Id !:= "my-id"
              , D.Style !:= "background-color:silver;"
              ]

              [ text_ "foo" ]
          , D.i [ klass_ "text-2xl" ] [ text_ "bar" ]
          , text_ " "
          , D.b__ "baz"
          ]
      ]
  )

main :: Effect Unit
main = void $ app (map (map void) runInBody')