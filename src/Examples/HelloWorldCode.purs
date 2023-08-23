module Examples.HelloWorldCode where

import Prelude
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import Deku.Control (text_)

app :: ExampleSignature
app runExample = runExample.t (text_ "Hello world")

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }