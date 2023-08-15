module Pages.AdvancedUsage.AccessingTheDOM where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute (theSelfAttribute)
import Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations (toplevelConsiderations)
import Router.ADT (Route(..))

accessingTheDOM :: Page
accessingTheDOM = page
  { route: AccessingTheDOM
  , topmatter: pure
      [ D.p [D.Class !:= "lead"]
          [ text_ "Raw-as-raw-gets DOM components"
          ]
      , D.p_
          [ text
              "Sometimes, we need direct access to a DOM element. For example, when dealing with forms, we need a way to get the contents of an "
          , D.code__ "input"
          , text
              " element on submit. This section goes over how to access the DOM on a per-element basis and also how to work with global DOM APIs at the top-level of your application."
          ]
      ]
  , sections:
      [ theSelfAttribute, toplevelConsiderations ]
  }
