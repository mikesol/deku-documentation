module Examples.AddingAttributes where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D

app :: ExampleSignature
app runExample = runExample
  ( D.div_
      [ D.span
          [ DA.style_ "color:teal;" ]
          [ text_ "I exist" ]
      , D.ul_ $ map D.li__ [ "A", "B", "C" ]
      , D.div_
          [ D.h3
              [ DA.id_ "my-id"
              , DA.style_ "background-color:silver;"
              ]

              [ text_ "foo" ]
          , D.i [ DA.klass_ "text-2xl" ] [ text_ "bar" ]
          , text_ " "
          , D.b__ "baz"
          ]
      ]
  )

main :: Effect Unit
main = void $ app (map (map void) runInBody')