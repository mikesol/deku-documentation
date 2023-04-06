module Pages.FRP.OtherInstances where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.OtherInstances.HeytingAlgebra (heytingAlgebra)
import Pages.FRP.OtherInstances.Monoid (monoid)
import Pages.FRP.OtherInstances.Ring (ring)
import Router.ADT (Route(..))

otherInstances :: Page
otherInstances = page
  { route: OtherInstances
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "Because who likes to lift2 over add when you can just add?"
          ]
      , D.p_
          [ text_
              "One of the annoying bits of working with any functorial type is that, for basic operations, you constantly have to "
          , D.code__ "map"
          , text_ " and "
          , D.code__ "lift2"
          , text_
              ". This gets un-fun after a while, so it's a common convention to add sensible instances of typeclasses related to the type "
          , D.code__ "a"
          , text_ " in "
          , D.code__ "f a"
          , text_
              " provided that there's an unambiguous interpretation of what they mean. Thankfully, in the case of "
          , D.code__ "Event"
          , text_ ", this is possible for many core typeclasses."
          ]
      ]
  , sections:
      [ monoid, heytingAlgebra, ring ]
  }
