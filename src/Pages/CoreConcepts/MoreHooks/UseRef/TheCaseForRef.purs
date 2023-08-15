module Pages.CoreConcepts.MoreHooks.UseRef.TheCaseForRef where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

theCaseForRef :: Subsection
theCaseForRef = subsection
  { title: "What's in a ref?"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.UseRef
      pure [ D.p_
          [ text_ "The "
          , D.code__ "useRef"
          , text_ " hook takes an initial value of type"
          , D.code__ "a"
          , text_ " and an event of type "
          , D.code__ "Event a"
          , text_ " and returns a value of type "
          , D.code__ "Effect a"
          , text_ " that is a reference to the most recent value of the event "
          , D.i__ "or"
          , text_ " the initial value if the event has never fired."
          ]
      , D.p_
          [ text
              "In the example below, slide the slider from left to right and click on buttons periodically. Each button will update with the most recent value of the slider when it is clicked."
          ]
      , example
      ]
  }
