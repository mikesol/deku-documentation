module Pages.FRP.FixAndFold.FoldingEvents.ASimpleCounter where

import Prelude

import Contracts (CollapseState(..), Env(..), Subsection, getEnv, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

aSimpleCounter :: Subsection
aSimpleCounter = subsection
  { title: "Two simple counters"
  , matter: do
      Env { routeLink } <- getEnv
      example <- getExample StartCollapsed Nothing Examples.ASimpleCounter
      pure
        [ D.p_
            [ text_ "Let's create two counters - one that uses the "
            , routeLink State
            , text_
                "-based methods we learned early in this documentation and one using folding. They'll both do the same thing, but the "
            , D.code__ "fold"
            , text_
                " method is a little classier, as you’ll be able to brag to your friends that you’re using fixed points. Your friends may appear indifferent, but they’ll secretly envy you."
            ]
        , example
        ]
  }
