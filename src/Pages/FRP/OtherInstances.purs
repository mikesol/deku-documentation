module Pages.FRP.OtherInstances where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.OtherInstances.Semigroup (semigroup)
import Router.ADT (Route(..))

otherInstances :: Page
otherInstances = page
  { route: OtherInstances
  , topmatter: pure
      [ D.p [D.Class := "lead"]
          [ text "Because who likes to lift2 over append when you can just append?"
          ]
      , D.p_
          [ text
              "One of the annoying bits of working with any functorial type is that, for basic operations, you constantly have to "
          , D.code__ "map"
          , text " and "
          , D.code__ "lift2"
          , text
              ". This gets un-fun after a while, so it's a common convention to add sensible instances of typeclasses related to the type "
          , D.code__ "a"
          , text " in "
          , D.code__ "f a"
          , text
              " provided that there's an unambiguous interpretation of what they mean. Thankfully, in the case of "
          , D.code__ "Event"
          , text ", this is possible for many core typeclasses."
          ]
      ]
  , sections:
      [ semigroup ]
  }
