module Pages.CoreConcepts.MoreHooks.FauxHooks where

import Prelude

import Contracts (CollapseState(..), getExample, Section, section)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

fauxHooks :: Section
fauxHooks = section
  { title: "Faux hooks"
  , topmatter: do
      example <- getExample StartCollapsed Nothing Examples.FauxHooks
      pure
        [ D.p_
            [ text_
                "They look like hooks, they feel like hooks, but they’re not hooks! Deku has a "
            , D.code__ "Deku.Effect"
            , text_ " module that, in general, has API parity with"
            , D.code__ "Deku.Hooks"
            , text_ ". The difference is, instead of using them in a "
            , D.code__ "Deku.do"
            , text_ " block, you use them in a plain old"
            , D.code__ "do"
            , text_ " block for "
            , D.code__ "Effect"
            , text_ " or "
            , D.code__ "ST Global"
            , text_
                ". The reason for this is that sometimes we need to use hook-like things at the top level of an application. This allows us to have code that exudes Deku-ness throught a full application."
            ]
        , example
        ]
  , subsections:
      []
  }
