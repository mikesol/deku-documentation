module Pages.FRP.FixAndFold where

import Prelude


import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.FixAndFold.FixedPoints (fixedPoints)
import Pages.FRP.FixAndFold.FixingEvents (fixingEvents)
import Pages.FRP.FixAndFold.FoldingEvents (foldingEvents)
import Router.ADT (Route(..))

fixAndFold :: forall lock payload. Page lock payload
fixAndFold = page
  { route: FixAndFold
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Fix and fold" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ fixedPoints, fixingEvents, foldingEvents ]
  }
