module Examples.UsingTheOriginalEvent where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Newtype (unwrap)
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Attribute ((:=), cb)
import Deku.DOM as D

import Web.Event.Event (type_)
import Web.HTML (window)
import Web.HTML.Window (alert)

main :: ExampleSignature
main runExample = runExample
  ( D.span
      [ D.OnClick := cb \e -> do
          window >>= alert (unwrap (type_ e))
      , klass "cursor-pointer"
      ]
      [ text "Click me!" ]
  )