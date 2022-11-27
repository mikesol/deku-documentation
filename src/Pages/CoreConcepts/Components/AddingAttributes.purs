module Pages.CoreConcepts.Components.AddingAttributes where

import Prelude

import Components.Code (psCode)
import Contracts (Section, section)
import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Components.AddingAttributes.ASingleAttribute (aSingleAttribute)
import Pages.CoreConcepts.Components.AddingAttributes.RemovingTheUnderscore (removingTheUnderscore)
import Pages.CoreConcepts.Components.AddingAttributes.SeveralAttributes (severalAttributes)
import Pages.CoreConcepts.Components.AddingAttributes.UsefulShorthand (usefulShorthand)

addingAttributes :: forall lock payload. Section lock payload
addingAttributes = section
  { title: "Adding attributes"
  , topmatter: pure
      [ D.p_
          [ text_
              "Of course, what fun would HTML be without some attributes? Let's fix that and make our DOM nice and stylish! We'll use the same example as before, but spiced up with some attributes."
          ]
      , psCode
          """module Main where

import Prelude

import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody
  ( D.div_
    [ D.span
       (D.Style !:= "color:teal;")
       [ text_ "I exist" ]
    , D.ul_ $ map D.li__ [ "A", "B", "C" ]
    , D.div_
        [ D.h3
          (oneOf
            [ D.Id !:= "my-id"
            , D.Style !:= "background-color:silver;"
            ]
          )
          [ text_ "foo" ]
        , D.i (klass_ "text-2xl") [ text_ "bar" ]
        , text_ " "
        , D.b__ "baz"
        ]
    ]
  )"""
      , text_ "And here's the result."
      , D.blockquote (klass_ "not-italic")
          [ D.div_
              [ D.span (D.Style !:= "color:teal;") [ text_ "I exist" ]
              , D.ul_ $ map D.li__ [ "A", "B", "C" ]
              , D.div_
                  [ D.h3
                      ( oneOf
                          [ D.Id !:= "my-id"
                          , D.Style !:= "background-color:silver;"
                          ]
                      )
                      [ text_ "foo" ]
                  , D.i (klass_ "text-2xl") [ text_ "bar" ]
                  , text_ " "
                  , D.b_ [ text_ "baz" ]
                  ]
              ]
          ]
      ]
  , subsections:
      [ removingTheUnderscore
      , aSingleAttribute
      , severalAttributes
      , usefulShorthand
      ]
  }
