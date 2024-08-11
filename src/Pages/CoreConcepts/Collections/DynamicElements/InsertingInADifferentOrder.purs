module Pages.CoreConcepts.Collections.DynamicElements.InsertingInADifferentOrder where

import Prelude

import Components.ProTip (proTip)
import Contracts (CollapseState(..), Env(..), Subsection, getEnv, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

insertingInADifferentOrder :: Subsection
insertingInADifferentOrder = subsection
  { title: "Inserting in a different order"
  , matter: do
      Env { routeLink } <- getEnv
      example <- getExample StartCollapsed Nothing
        Examples.InsertingInADifferentOrder
      pure
        [ D.p_
            [ text_
                "Sometimes, you want to insert elements in a particular order instead of the first element being inserted at the top of a list. There's a hook for that! Instead of "
            , D.code__ "useDynAtBeginning"
            , text_ " or its homologue "
            , D.code__ "useDynAtEnd"
            , text_ ", we’ll use plain old "
            , D.code__ "useDyn"
            , text_
                ". This hook expects an event of type "
            , D.code__ "Tuple Int a"
            , text_
                "which is constructed from two values:"
            , D.ol_
                [ D.li_ [ text_ "An index at which to insert the element; and" ]
                , D.li_ [ text_ "The element to insert." ]
                ]
            ]
        , example
        , proTip
            { header:
                D.span_ [ text_ "The ", D.code__ "<|*>", text_ " operator" ]
            , message: D.div_
                [ text_ "In the example above, we see a new operator "
                , D.code__ "<|*>"
                , text_
                    ". We need to use it here because otherwise we'd add a todo item whenever we change the number in the input. This operator is part of a larger collection of operators used for "
                , routeLink Sampling
                , text_ ", which we’ll go over later."
                ]
            }
        , D.p_
            [ text_
                "Note that, if the index overshoots or undershoots the collection's bounds, the element will go to the end or beginning of the collection respectively."
            ]
        ]
  }
