module Pages.CoreConcepts.Providers.FunctionsAsProviders.MixingDoNotation where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

mixingDoNotation :: Subsection
mixingDoNotation = subsection
  { title: "Effect systems"
  , matter: do
      example <- getExample StartExpanded Nothing
        Examples.EffectSystem
      pure
        [ D.p_
            [ text_
                "Providers are one example of a broader functional pattern called "
            , D.i__ "effect systems"
            , text_
                ". In effect systems, there's some collection of side effects that you interpret. The side effect of providers is function application, but we can go wild with whatever effects we want."
            ]
        , D.p_
            [ text_ "Let's create an effect system that contains a provider "
            , D.i__ "and"
            , text_
                " a ticker that increments as we create checkboxes. There are several ways to do this in PureScript, but we'll use a Free Monad in the following example. The nice thing about Free Monads is that you can start small with a couple effects and gradually expand them to an effect system of epic proportions about which funcitonal troubadours will sing for ages to come."
            ]
        , example
        ]
  }
