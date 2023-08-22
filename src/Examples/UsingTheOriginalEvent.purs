module Examples.UsingTheOriginalEvent where

import Prelude

import Data.Newtype (unwrap)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import Web.Event.Event (type_)
import Web.HTML (window)
import Web.HTML.Window (alert)
import Web.PointerEvent.PointerEvent (toEvent)

app :: ExampleSignature
app runExample = runExample
  ( D.span
      [ DL.click_ \e -> do
          window >>= alert (unwrap (type_ $ toEvent e))
      , DA.klass_ "cursor-pointer"
      ]
      [ text_ "Click me!" ]
  )

main :: Effect Unit
main = void $ app (map (map void) runInBody')