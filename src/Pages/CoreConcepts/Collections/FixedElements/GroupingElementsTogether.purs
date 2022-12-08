module Pages.CoreConcepts.Collections.FixedElements.GroupingElementsTogether where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Deku.Attribute ((!:=))
import Deku.Attributes (href_, klass_)
import Deku.Control (text_)
import Deku.Core (fixed)
import Deku.DOM as D
import Examples as Examples

groupingElementsTogether :: forall lock payload. Subsection lock payload
groupingElementsTogether = subsection
  { title: "Grouping components together"
  , matter: pure
      [ D.p_
          [ text_ "To group components together, you can pass an array of components to the "
          , D.code__ "fixed"
          , text_
              " function. The components will render into the correct position in the parent component."
          ]
      , D.p_
          [ text_
              "As an example, consider the following version of Old MacDonald. We use "
          , D.code__ "fixed"
          , text_ " for the lyric "
          , D.i__ "e i e i o"
          , text_ " so as to avoid needless code duplication. "
          ]
      , psCodeWithLink Examples.GroupingComponents
      , exampleBlockquote
          do
            let
              eieio = fixed
                [ D.span (klass_ "text-blue-400") [ text_ "e " ]
                , D.span (klass_ "text-red-400") [ text_ "i " ]
                , D.span (klass_ "text-green-400") [ text_ "e " ]
                , D.span (klass_ "text-teal-400") [ text_ "i " ]
                , D.span (klass_ "text-orange-400") [ text_ "o" ]
                ]

            [ text_ "Old MacDonald had a farm, "
            , eieio
            , text_ ". And on that farm he had a dog, "
            , eieio
            , text_
                ". With a woof-woof here and a woof-woof there. "
            , text_ "Here a woof, there a woof, everywhere a woof-woof. "
            , text_ "Old MacDonald had a farm, "
            , eieio
            , text_ "."
            ]
      , proTip
          { header: text_ "Animal sounds in different cultures"
          , message: D.div_
              [ text_
                  "Dogs say woof in English, but every culture has its own animal sounds. Before using Deku, make sure to familiarize yourself with "
              , D.a
                  ( href_
                      "https://languagepro.com.br/woof-woof-dog-barks-in-different-languages/"
                      <|> D.Target !:= "_blank"
                  )
                  [ text_ "how dogs bark in multiple languages" ]
              , text_ "."
              ]
          }
      , D.p_
          [ text_ "With "
          , D.code__ "fixed"
          , text_
              ", you don't need to do any extra accounting when subbing arrays in and out of the DOM. Deku automatically manages node insertion and deletion so that fixed elements always show up in the right place."
          ]
      ]
  }
