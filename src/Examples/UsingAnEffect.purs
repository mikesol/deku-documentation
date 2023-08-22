module Examples.UsingAnEffect where

import Prelude

import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import Web.HTML (window)
import Web.HTML.Window (alert)

app :: ExampleSignature
app runExample = runExample do
  D.span
    [ DL.click_ \_ ->
        window >>= alert "Thanks for clicking!"
    , DA.klass_ "cursor-pointer"
    ]
    [ text_ "Click me!" ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')