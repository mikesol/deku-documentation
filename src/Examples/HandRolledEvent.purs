module Examples.HandRolledEvent where

import Deku.Toplevel (runInBody')
import Prelude

import Control.Monad.Error.Class (throwError)
import Data.Maybe (maybe)
import Effect (Effect)
import Effect.Exception (error)
import Effect.Random (random)
import Effect.Ref (new, read, write)
import Effect.Timer (clearInterval, setInterval)
import ExampleAssitant (ExampleSignature)
import Web.DOM.Document (createElement, createTextNode)
import Web.DOM.Element (setAttribute, toEventTarget, toNode)
import Web.DOM.Node (appendChild, setTextContent)
import Web.DOM.Text as TN
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body, toDocument)
import Web.HTML.HTMLElement as HTMLElement
import Web.HTML.Window (document)

type Event a = (a -> Effect Unit) -> Effect (Effect Unit)

app :: ExampleSignature
app runExample = do
  bod <- window >>= document >>= body >>= maybe
    (throwError $ error "Could not find body")
    pure
  doc <- window >>= document <#> toDocument
  anchor <- createElement "a" doc
  setAttribute "class" "cursor-pointer" anchor
  setTextContent "Turn on event" (toNode anchor)
  txt <- createTextNode " " doc
  div <- createElement "div" doc
  setAttribute "style" "hidden" div
  appendChild (toNode anchor) (HTMLElement.toNode bod)
  appendChild (TN.toNode txt) (HTMLElement.toNode bod)
  appendChild (toNode div) (HTMLElement.toNode bod)
  onOff <- new false
  unsubscribe <- new (pure unit)
  let
    (event :: Event Number) = \callback -> do
      random >>= callback
      i <- setInterval 400 do
        random >>= callback
      pure do
        clearInterval i
  el <- eventListener \_ -> do
    read onOff >>= case _ of
      false -> do
        u <- event \v -> setTextContent (show v) (toNode div)
        write u unsubscribe
        write true onOff
        setTextContent "Turn off event" (toNode anchor)
      true -> do
        u <- read unsubscribe
        u
        write false onOff
        setTextContent "Turn on event" (toNode anchor)
  addEventListener (EventType "click") el true
    (toEventTarget anchor)
  pure (pure unit)

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }