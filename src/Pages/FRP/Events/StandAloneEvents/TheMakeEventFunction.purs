module Pages.FRP.Events.StandAloneEvents.TheMakeEventFunction where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Attributes (href_)
import Deku.Control (text_)
import Deku.DOM as D

theMakeEventFunction :: Subsection
theMakeEventFunction = subsection
  { title: "The makeEvent function"
  , matter: pure
      [ D.p_
          [ text_ "To make a stand-alone effect, use the "
          , D.code__ "makeEvent"
          , text_ " function. This function has the signature of "
          , D.code__ "Event"
          , text_ " we saw before, namely:"
          ]
      , psCode
          """makeEvent
  :: forall a
  . ((a -> Effect Unit) -> Effect (Effect Unit))
  -> Event a"""
      , D.p_
          [ text_ "In other words, for all intents and pursposes, "
          , D.code__ "makeEvent"
          , text_ " is a no-op - it takes an event and returns an event."
          ]
      , D.p_
          [ text_
              "As an example, supposed you wanted an event to fire every time the browser requested an animation frame via "
          , D.a
              [href_
                  "https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame"
                  , (D.Target !:= "_blank")
              ]
              [ D.code__ "requestAnimationFrame" ]
          , text_ ". One way to accomplish that would be via "
          , D.code__ "makeEvent"
          , text_ "."
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
