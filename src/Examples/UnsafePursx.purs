module Examples.UnsafePursx where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Pursx ((~!~))

app :: ExampleSignature
app runExample = runExample ("<h4>(un)safe!</h4>" ~!~ {})

main :: Effect Unit
main = void $ app (map (map void) runInBody')