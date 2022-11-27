module Pages.FRP.Busses.TheVBus.SettingUpAVBus where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

settingUpAVBus :: forall lock payload. Subsection lock payload
settingUpAVBus = subsection
  { title: "Setting up a v-bus"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Setting up a v-bus" ]
          , text_ "."
          ]
      ]
  }
