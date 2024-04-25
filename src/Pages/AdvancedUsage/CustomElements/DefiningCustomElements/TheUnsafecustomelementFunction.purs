module Pages.AdvancedUsage.CustomElements.DefiningCustomElements.TheUnsafeCustomElementFunction where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

theUnsafeCustomElementFunction :: Subsection
theUnsafeCustomElementFunction = subsection
  { title: "The elementify function"
  , matter: do
      example <- getExample StartExpanded Nothing Examples.UnsafeCustomElement
      pure
        [ D.p_
            [ text_ "In order to create a custom element, use the "
            , D.code__ "elementify"
            , text_
                " function. It's actually pretty safe all things considered, as the worst it can do is crash your app. Unless your app is controlling traffic lights or something, in which case it is definitely not safe."
            ]
        , D.p_
            [ text_
                "As Deku has the whole DOM covered, there's not a single tag we can think of that isn't Deku-ified. So this method is only useful to create custom aliases for tags that have different polls "
            , D.i__ "or"
            , text_ " to add new tags if Deku is out of line with the DOM spec."
            ]
        , example
        ]
  }
