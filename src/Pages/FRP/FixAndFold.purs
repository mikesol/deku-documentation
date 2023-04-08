module Pages.FRP.FixAndFold where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.FixAndFold.FixedPoints (fixedPoints)
import Pages.FRP.FixAndFold.FoldingEvents (foldingEvents)
import Router.ADT (Route(..))

fixAndFold :: Page
fixAndFold = page
  { route: FixAndFold
  , topmatter: pure
      [ D.p [D.Class !:= "lead"]
          [ text_ "Behold the crown jewel of functional reactive programming!"
          ]
      , D.p_
          [ text_
              "We've seen the "
          , D.code__ "fold"
          , text_
              " function over and over in this documentation, and yet we haven't been able to define it yet. To get there, we needed a thorough understanding of "
          , D.code__ "Event"
          , text_
              "s, their instances, and how sampling works. Armed with that knowledge, we'll be able to precisely define what "
          , D.code__ "fold"
          , text_ " is, and even more generally, what "
          , D.code__ "fix"
          , text_ " is for an "
          , D.code__ "Event"
          , text_ "."
          ]
      ]
  , sections:
      [ fixedPoints, {-fixingEvents,-} foldingEvents ]
  }
