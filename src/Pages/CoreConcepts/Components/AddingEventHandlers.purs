module Pages.CoreConcepts.Components.AddingEventHandlers where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Components.AddingEventHandlers.ShorthandListeners (shorthandListeners)
import Pages.CoreConcepts.Components.AddingEventHandlers.UsingAnEffect (usingAnEffect)
import Pages.CoreConcepts.Components.AddingEventHandlers.UsingTheOriginalEvent (usingTheOriginalEvent)

addingEventHandlers :: Section
addingEventHandlers = section
  { title: "Adding event handlers"
  , topmatter: pure
      [ D.p_
          [ text_
              "The web would be quite uneventful without events. Be they clicks or scrolls or hovers, Deku is your one-stop-shop for event planning!"
          ]
      ]
  , subsections:
      [ usingAnEffect, usingTheOriginalEvent, shorthandListeners ]
  }
