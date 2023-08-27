module Pages.CoreConcepts.Components.AddingAttributes where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Section, section)
import Deku.DOM.Attributes as DA

import Deku.Control (text_)
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
          [ text_
              "What fun would HTML be without any attributes? Un-fun, like the example above. Let's fix that and make our DOM nice and stylish! We'll use the same example as before, but spiced up with attributes."
          ]
      , psCodeWithLink Examples.AddingAttributes
      , text_ "And here's the result."
      , exampleBlockquote
          [ D.div_
              [ D.span [ DA.style_ "color:teal;" ] [ text_ "I exist" ]
              , D.ul_ $ map D.li__ [ "A", "B", "C" ]
              , D.div_
                  [ D.h3
                      [ DA.id_ "my-id"
                      , DA.style_ "background-color:silver;"
                      ]
                      [ text_ "foo" ]
                  , D.i [ DA.klass_ "text-2xl" ] [ text_ "bar" ]
                  , text_ " "
                  , D.b_ [ text_ "baz" ]
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
