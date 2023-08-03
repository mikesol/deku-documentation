module Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheRunSSRFunction where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

theRunSSRFunction :: Subsection
theRunSSRFunction = subsection
  { title: "The runSSR function"
  , matter: do
      example <- getExample StartExapanded Nothing Examples.RunSSR
      pure [ D.p_
          [ text "In order to turn a Deku site into a static site, use "
          , D.code__ "runSSR"
          , text ". The example below gets all inception-y, calling "
          , D.code__ "runSSR"
          , text " on itself in the most gimmicky of ways."
          ]
      , example
      ]
  }
