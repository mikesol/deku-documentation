module Pages.CoreConcepts.State where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.State.StateWithoutInitialValues (stateWithoutInitialValues)
import Pages.CoreConcepts.State.TheStateHook (theStateHook)
import Router.ADT (Route(..))

state :: forall lock payload. Page lock payload
state = page
  { route: State
  , topmatter:
          [ D.p (D.Class !:= "lead")
              [ text_ "This page will be about "
                , D.span (D.Class !:= "font-bold") [ text_ "State"]
                , text_ "."
              ]
          , D.p_
              [ text_
                  "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
              ]
          ]
  , sections:
      [ theStateHook,stateWithoutInitialValues]
  }
