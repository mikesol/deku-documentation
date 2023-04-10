module Pages.FRP.Alternatives where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Alternatives.Alt (alt)
import Pages.FRP.Alternatives.Plus (plus)
import Router.ADT (Route(..))

alternatives :: Page
alternatives = page
  { route: Alternatives
  , topmatter: pure
      [ D.p [D.Class !:= "lead"]
          [ text_ "How events function in an alternative universe."
          ]
      , D.p_
          [ text_
              "In functional programming, we tend to be obsessed with two classes of operations."
          ]
      , D.ol_
          [ D.li__ "Composing stuff together"
          , D.li__ "Applying an identity function."
          ]
      , D.p__ "This expresses itself in many different places:"
      , D.ul_
          [ D.li__ "Function composition and the identity function"
          , D.li__ "Semigroups and monoids"
          , D.li__ "Applicative functors"
          ]
      , D.p_
          [ text_ "Another place we see this is the "
          , D.code__ "Alternative"
          , text_
              " class, where composition fuses together collections and the identity element is the empty collection. "
          , D.code__ "Event"
          , text_ " is a great candidate for an "
          , D.code__ "Alternative"
          , text_ " instance, so let's see what "
          , D.code__ "alt"
          , text_ "-ing events looks like!"
          ]
      ]
  , sections:
      [ alt, plus ]
  }
