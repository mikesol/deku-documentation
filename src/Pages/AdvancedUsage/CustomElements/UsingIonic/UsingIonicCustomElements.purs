module Pages.AdvancedUsage.CustomElements.UsingIonic.UsingIonicCustomElements where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.DOM as D
import Examples as Examples

usingIonicCustomElements :: Subsection
usingIonicCustomElements = subsection
  { title: "Using our custom elements"
  , matter: do
      example <- getExample StartExapanded Nothing Examples.MockDiscord
      pure
        [ D.p__
            "We can define our Discord elements the same way we defined our custom anchor element above."
        , example
        ]
  }
