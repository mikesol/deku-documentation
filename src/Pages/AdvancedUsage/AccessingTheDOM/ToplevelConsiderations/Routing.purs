module Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations.Routing where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

routing :: forall lock payload. Subsection lock payload
routing = subsection
  { title: "Routing"
  , matter: pure
      [ D.p_
          [ text_ "Deku apps work swimmingly with "
          , targetedLink
              "https://github.com/natefaubion/purescript-routing-duplex"
              [ D.code__ "purescript-routing-duplex" ]
          , text_
              " for routing. Unfortunately, this is one of the few things we cannot show with a live example in this documentation because it involves top-level routing, which by definiton would change the routing of the page you're looking at, which would be a nuissance."
          ]
      , D.p_
          [ text_
              "In lieu of a proper interactive example, you can see a text example in this documentation's "
          , targetedLink
              "https://github.com/mikesol/deku-documentation/blob/4f184ec2c28eba1d1f5dd5547114ce29c43e6172/src/Main.purs#L166"
              [ text_ "source code" ]
          , text_ ". Each page in the documentation is a route, and "
          , D.code__ "routing-duplex"
          , text_
              " is used to alternate between these pages while keeping certain elements, like the header and left page links, constant so as to avoid needless redraws."
          ]
      ]
  }
