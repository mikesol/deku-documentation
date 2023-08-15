module Examples.UsingTheOriginalEvent where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Newtype (unwrap)
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.Attribute ((:=), cb)
import Deku.DOM as D

import Web.Event.Event (type_)
import Web.HTML (window)
import Web.HTML.Window (alert)

app :: ExampleSignature
app runExample = runExample
  ( D.span
      [ pure $ D.OnClick := cb \e -> do
          window >>= alert (unwrap (type_ e))
      , klass_ "cursor-pointer"
      ]
      [ text_ "Click me!" ]
  )

main :: Effect Unit
main = void $ app (map (map void) runInBody')