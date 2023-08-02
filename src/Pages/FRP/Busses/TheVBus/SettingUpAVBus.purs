module Pages.FRP.Busses.TheVBus.SettingUpAVBus where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.Attribute ((:=))
import Deku.DOM as D

settingUpAVBus :: Subsection
settingUpAVBus = subsection
  { title: "Setting up a v-bus"
  , matter: pure
      [ D.p_
          [ text "This subsection will be about "
          , D.span [ D.Class := "font-bold" ] [ text "Setting up a v-bus" ]
          , text "."
          ]
      ]
  }
