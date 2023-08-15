module Pages.CoreConcepts.Collections.FixedElements.GroupingElementsTogether where

import Prelude

import Components.ProTip (proTip)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Attributes (href)
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

groupingElementsTogether :: Subsection
groupingElementsTogether = subsection
  { title: "Grouping components together"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.GroupingComponents
      pure
        [ D.p_
            [ text
                "To group components together, you can pass an array of components to the "
            , D.code__ "fixed"
            , text
                " function. The components will render into the correct position in the parent component."
            ]
        , D.p_
            [ text
                "As an example, consider the following version of Old MacDonald. We use "
            , D.code__ "fixed"
            , text_ " for the lyric "
            , D.i__ "e i e i o"
            , text_ " so as to avoid needless code duplication. "
            ]
        , example
        , proTip
            { header: text_ "Animal sounds in different cultures"
            , message: D.div_
                [ text
                    "Dogs say woof in English, but every culture has its own animal sounds. Before using Deku, make sure to familiarize yourself with "
                , D.a
                    [ href
                        "https://languagepro.com.br/woof-woof-dog-barks-in-different-languages/"
                    , D.Target !:= "_blank"
                    ]
                    [ text_ "how dogs bark in multiple languages" ]
                , text_ "."
                ]
            }
        , D.p_
            [ text_ "With "
            , D.code__ "fixed"
            , text
                ", you don't need to do any extra accounting when subbing arrays in and out of the DOM. Deku automatically manages node insertion and deletion so that fixed elements always show up in the right place."
            ]
        ]
  }
