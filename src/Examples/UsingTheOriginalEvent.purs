module Examples.UsingTheOriginalEvent where

import Prelude

import Data.Newtype (unwrap)
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Attribute ((:=), cb)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Web.Event.Event (type_)
import Web.HTML (window)
import Web.HTML.Window (alert)

main :: Effect Unit
main = runInBody
  ( D.span
      [ D.OnClick := cb \e -> do
          window >>= alert (unwrap (type_ e))
      , klass "cursor-pointer"
      ]
      [ text "Click me!" ]
  )