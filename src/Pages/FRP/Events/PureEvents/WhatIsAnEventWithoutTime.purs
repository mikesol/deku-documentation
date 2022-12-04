module Pages.FRP.Events.PureEvents.WhatIsAnEventWithoutTime where

import Prelude

import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

whatIsAnEventWithoutTime :: forall lock payload. Subsection lock payload
whatIsAnEventWithoutTime = subsection
  { title: "What is an event without time?"
  , matter: pure
      [ D.p_
          [ text_
              "For an event to take place out of time, or rather in a sort of \"flat\" time, the time-based aspects of a computation need to be controlled by a different clock than the vagueries of browser-based, inaccurate timers like "
          , D.code__ "setTimeout"
          , text_ " and "
          , D.code__ "setInterval"
          , text_ ". This doesn't mean that we eschew before/after relationships, but rather that these relationships need to be controlled by an interpreter that is more precise than the browser."
          ], proTip { header: text_ "Different flavors of time", message: D.div_ [text_ "When we talk about precise time, we don't mean time that is precise according to some arbitrary measurement of clock time at some point in the universe. Rather, we mean an environment where we can model and reproduce temporal phenomena. The actual speed of these systems is irrelevant, provided they finish executing before we die or become senile. For example, if we run them on a computer from the 1950s, they will necessarily execute slower than on a MacBook Pro M2. In these cases, it's ok to limit time to that which can be articulated precisely, even if we lose some of the granularity that we gain from the browser's time APIs."]}
      ]
  }
