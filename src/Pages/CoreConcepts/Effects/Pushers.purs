module Pages.CoreConcepts.Effects.Pushers where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Pusherss.TriggeringAPushersFromAHandler (triggeringAPushersFromAHandler)
import Pages.CoreConcepts.Effects.Pusherss.TriggeringAPushersFromAsynchronousCode (triggeringAPushersFromAsynchronousCode)

pushers :: forall lock payload. Section lock payload
pushers = section
  { title: "Pushers"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Pushers" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ triggeringAPushersFromAHandler
      , triggeringAPushersFromAsynchronousCode
      ]
  }
