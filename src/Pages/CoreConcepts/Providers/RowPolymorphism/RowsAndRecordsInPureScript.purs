module Pages.CoreConcepts.Providers.RowPolymorphism.RowsAndRecordsInPureScript where

import Prelude

import Components.Code (psCode)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

rowsAndRecordsInPureScript :: Subsection
rowsAndRecordsInPureScript = subsection
  { title: "Rows and records in PureScript"
  , matter: pure
      [ D.p_
          [ text
              "Rows and records are incredibly powerful concepts in PureScript. Many texts about functional programming and dependent types treat rows as an advanced concept, but PureScript has made them first-class citizens of the language to the point where working with them feels natural and easier than many other language features. If you're comfortable writing JSON, you should feel at home with rows and records!"
          ]
      , D.p_
          [ text_ "A "
          , D.code__ "Record"
          , text
              " in PureScript is defined with curly brackets and has a series of key-value pairs. Here's an example:"
          ]
      , psCode "{ foo: 1, bar: true }"
      , D.p__ "The type of this record would be the following: "
      , psCode "{ foo :: Int, bar :: Boolean }"
      , D.p_
          [ text
              "Records are backed by rows. Rows, indicated by parentheses instead of curly brackets, are "
          , targetedLink "https://en.wikipedia.org/wiki/Kind_(type_theory)"
              [ D.code__ "kind" ]
          , text
              " constructors that allow you to represent sum and product types of arbitrary arity. For example, if one has a row with the following definition: "
          ]
      , psCode "(foo :: Int, bar :: Boolean)"
      , D.p_
          [ text
              "This could be used to encode a record (a product of these terms, meaning all must be present) "
          , D.i__ "or"
          , text
              " a variant (a sum of these terms, meaning only one is present). Other types can be encoded as well. From a theoretical perspective, rows are so powerful because they represent a potential indexing of the entire domain of a language, from the empty row:"
          ]
      , psCode "()"
      , D.p_ [ text_ "To the row of all types:" ]
      , psCode
          """( int :: Int
, boolean :: Boolean
, string :: String
, arrayInt :: Array Int
...
)"""
      , D.p__
          "I'm not going to write them all out because it would take ∞ minutes, but convince yourself that one could build a monster row containing every type in a language."
      ]
  }
