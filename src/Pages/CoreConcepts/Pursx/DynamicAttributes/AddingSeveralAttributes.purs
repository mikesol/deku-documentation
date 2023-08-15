module Pages.CoreConcepts.Pursx.DynamicAttributes.AddingSeveralAttributes where

import Prelude

import Components.Disclaimer (disclaimer)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

addingSeveralAttributes :: Subsection
addingSeveralAttributes = subsection
  { title: "Adding several attributes"
  , matter: do
      example <- getExample StartExapanded Nothing
        Examples.AddingSeveralAttributesToPursx
      pure
        [ D.p__
            "A more natural way to implement the breadcrumbs would be to embed the click listener directly in the crumbs in addition to the anchor elements. We can do this by adding multiple attributes to an element in Pursx."
        , example
        , D.p_
            [ text_ "By using the tie fighter "
            , D.code__ "<|>"
            , text
                ", we were able to compose the breadcrumb's class and its click listener together, just like if we were working with attributes in a Deku component. This allows you to mix Pursx code and Deku components."
            ]
        , disclaimer
            { header: D.span_
                [ text_ "No ", D.code__ "let", text_ " polymorphism" ]
            , message: D.p_
                [ text_ "PureScript lacks "
                , D.code__ "let"
                , text_ " polymorphism, meaning that effects like "
                , D.code__ "toggleHome"
                , text_ " and "
                , D.code__ "toggleNero"
                , text
                    " need an explicit polymorphic signature when used for different DOM elements. Otherwise, they would be specialized to their first call site, which in this case is an "
                , D.code__ "a"
                , text
                    " tag. That's why we use explicit signatures for the toggle effects."
                ]
            }
        ]
  }
