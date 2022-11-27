module Modal where

import Prelude


import Prelude

import Data.Foldable (traverse_)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Ref as Ref
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener, removeEventListener)
import Web.HTML (window)
import Web.HTML.Window (toEventTarget)

modalClick :: Effect Unit -> Effect Unit
modalClick eff = do
  listenerRef <- Ref.new Nothing
  listener <- eventListener \_ -> do
    eff
    Ref.read listenerRef >>= traverse_
      ( \l -> toEventTarget <$> window >>=
          removeEventListener (EventType "click") l true
      )
  toEventTarget <$> window >>= addEventListener
    (EventType "click")
    listener
    true