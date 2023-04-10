module Examples.UsingTheOriginalEvent where

import Prelude

import Data.Newtype (unwrap)
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Attribute ((!:=), cb)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Web.Event.Event (type_)
import Web.HTML (window)
import Web.HTML.Window (alert)

main :: Effect Unit
main = runInBody
  ( D.span
      [ D.OnClick !:= cb \e -> do
          window >>= alert (unwrap (type_ e))
      , klass_ "cursor-pointer"
      ]
      [ text_ "Click me!" ]
  )