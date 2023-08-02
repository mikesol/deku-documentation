module Pages.FRP.Events.StandAloneEvents.TheMakeEventFunction where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Attribute ((:=))
import Deku.Attributes (href)
import Deku.Control (text)
import Deku.DOM as D

theMakeEventFunction :: Subsection
theMakeEventFunction = subsection
  { title: "The makeEvent function"
  , matter: pure
      [ D.p_
          [ text "To make a stand-alone effect, use the "
          , D.code__ "makeEvent"
          , text " function. This function has the signature of "
          , D.code__ "Event"
          , text " we saw before, namely:"
          ]
      , psCode
          """makeEvent
  :: forall a
  . ((a -> Effect Unit) -> Effect (Effect Unit))
  -> Event a"""
      , D.p_
          [ text "In other words, for all intents and pursposes, "
          , D.code__ "makeEvent"
          , text " is a no-op - it takes an event and returns an event."
          ]
      , D.p_
          [ text
              "As an example, supposed you wanted an event to fire every time the browser requested an animation frame via "
          , D.a
              [href
                  "https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame"
                  , (D.Target := "_blank")
              ]
              [ D.code__ "requestAnimationFrame" ]
          , text ". One way to accomplish that would be via "
          , D.code__ "makeEvent"
          , text "."
          ]
      , psCode
          """animationFrame :: Event Unit
animationFrame = makeEvent \k -> do 
  w <- window
  cancelled <- Ref.new false
  let loop = void do
        w # requestAnimationFrame do
          k unit
          unlessM (Ref.read cancelled) loop
  loop
  pure (Ref.write true cancelled)"""
      ]
  }
