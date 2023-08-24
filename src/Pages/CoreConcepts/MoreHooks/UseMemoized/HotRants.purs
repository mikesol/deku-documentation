module Pages.CoreConcepts.MoreHooks.UseMemoized.HotRants where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

hotRants :: Subsection
hotRants = subsection
  { title: "The useHotRant hook"
  , matter: do
      example1 <- getExample StartCollapsed Nothing Examples.FoldingRants
      example2 <- getExample StartCollapsed Nothing Examples.FoldingHotRants
      pure
        [ D.p_
            [ D.code__ "useRant"
            , text_
                " has another superpower that will become evident when we learn about "
            , D.code__ "fix"
            , text_ " and "
            , D.code__ "fold"
            , text_ " in later sections. "
            , D.code__ "folds"
            , text_
                " always start anew at the point of usage, which means that if a fold is an accumulator, it will start accumulating from scratch everywhere it is used. But sometimes, you want a fold to contain its most-recent value."
            , D.code__ "useRant"
            , text_ " is handy in these situations."
            ]
        , example1
        , D.p_
            [ text_ "There is even a "
            , D.code__ "useHotRant"
            , text_ " hook that, like useHot "
            , text_
                " will play back the most recent value as well. Because the only thing that's better than a rant is a "
            , D.i__ "hot rant"
            , text_ "."
            ]
        , example2
        ]
  }
