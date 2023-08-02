module Pages.FRP.Events.StandAloneEvents.UnsubscribeEtiquette where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

unsubscribeEtiquette :: Subsection
unsubscribeEtiquette = subsection
  { title: "Unsubscribe etiquette"
  , matter: pure
      [ D.p_
          [ text
              "In the examples we've seen so far of stand-alone events, the unsubscribe function has only been used to stop loops. However, there is nothing that stops the unsubscribe function from calling the callback as many times as it wants. Sometimes, you'll even want the callback to fire on unsubscribe - for example, if the unsubscribe needs to send instructions to the subscription to turn off a resource."
          ]
      , D.p_
          [ text
              "That said, we recommend being very conservative when unsubscribing from events, doing the bare minimum needed to safely clean up whatever resources were acquired over the lifetime of the event. Mishandling the unsubscribe function can lead to memory leaks and performance degradation. So keep unsubscribe simple!"
          ]
      ]
  }
