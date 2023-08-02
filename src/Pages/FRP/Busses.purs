module Pages.FRP.Busses where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Busses.ASimpleBus (aSimpleBus)
import Pages.FRP.Busses.BusFixIsomorphism (busFixIsomorphism)
import Pages.FRP.Busses.TheVBus (theVBus)
import Router.ADT (Route(..))

busses :: Page
busses = page
  { route: Busses
  , topmatter: pure
      [ D.p [D.Class := "lead"]
          [ text "This page will be about "
          , D.span [D.Class := "font-bold"] [ text "Busses" ]
          , text "."
          ]
      , D.p_
          [ text
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ aSimpleBus, theVBus, busFixIsomorphism ]
  }
