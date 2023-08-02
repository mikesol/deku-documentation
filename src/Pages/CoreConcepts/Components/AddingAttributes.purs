module Pages.CoreConcepts.Components.AddingAttributes where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Section, section)
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import Pages.CoreConcepts.Components.AddingAttributes.ASingleAttribute (aSingleAttribute)
import Pages.CoreConcepts.Components.AddingAttributes.RemovingTheUnderscore (removingTheUnderscore)
import Pages.CoreConcepts.Components.AddingAttributes.UsefulShorthand (usefulShorthand)

addingAttributes :: Section
addingAttributes = section
  { title: "Adding attributes"
  , topmatter: pure
      [ D.p_
          [ text
              "What fun would HTML be without any attributes? Un-fun, like the example above. Let's fix that and make our DOM nice and stylish! We'll use the same example as before, but spiced up with attributes."
          ]
      , psCodeWithLink Examples.AddingAttributes
      , text "And here's the result."
      , exampleBlockquote
          [ D.div_
              [ D.span [D.Style := "color:teal;"] [ text "I exist" ]
              , D.ul_ $ map D.li__ [ "A", "B", "C" ]
              , D.div_
                  [ D.h3
                          [ D.Id := "my-id"
                          , D.Style := "background-color:silver;"
                          ]
                      [ text "foo" ]
                  , D.i [klass "text-2xl"] [ text "bar" ]
                  , text " "
                  , D.b_ [ text "baz" ]
                  ]
              ]
          ]
      ]
  , subsections:
      [ removingTheUnderscore
      , aSingleAttribute
      , usefulShorthand
      ]
  }
