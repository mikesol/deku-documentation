module Pages.FRP.Events.StandAloneEvents.UnsubscribeEtiquette where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

unsubscribeEtiquette :: Subsection
unsubscribeEtiquette = subsection
  { title: "Idempotency"
  , matter: pure
      [ D.p_
          [ text_
              "In the examples we've seen so fars, the unsubscribe effect has only been used to stop loops. However, there is nothing that prevents you from running an unsubscribe effect multiple times."
          ]
      , D.p_
          [ text_
              "We've done our best to make sure that unsubscribe is idempotent, meaning that you can run it as many times as you want without wreaking havoc on your program. That said, it's still a good idea to be mindful of how you use it. For example, unsubscribe can have "
          , D.i__ "O(log(n))"
          , text_
              " performance in some cases, which can slow down your program if it's called over and over accidentally. So keep it simple!"
          ]
      ]
  }
