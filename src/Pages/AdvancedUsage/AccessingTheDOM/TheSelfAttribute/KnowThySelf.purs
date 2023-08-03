module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelf where

import Prelude

import Components.Disclaimer (disclaimer)
import Contracts (Subsection, CollapseState(..), getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

knowThySelf :: Subsection
knowThySelf = subsection
  { title: "Know thy Self"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.KnowThySelf
      pure [ D.p_
          [ text "An event hooked up to the special "
          , D.code__ "Self"
          , text
              " attribute will invoke an effectful function with the DOM element as its argument whenever the event fires. Note that the event fires "
          , D.i__ "before"
          , text
              " an element's attributes and children are added, so make sure to defer your computation until the next browser tick if you want these things to be present, like in the example below."
          ]
      , example
      , disclaimer
          { header: text "Who would've thunk?"
          , message: D.div_
              [ text "Because it is not a listener, the "
              , D.code__ "Self"
              , text
                  " attribute thunks its effect immediately when an event occurs. So make sure to manage your events carefully and/or to make sure your effectful shenanigans with your"
              , D.code__ "Self"
              , text " are idempotent."
              ]
          }
      ]
  }
