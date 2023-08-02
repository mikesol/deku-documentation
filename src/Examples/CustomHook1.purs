module Examples.CustomHook1 where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text)
import Deku.Core (Hook)
import Deku.DOM as D
import Deku.Do as Deku

app :: ExampleSignature
app runExample = runExample Deku.do
  let
    myFortyTwoHook :: Hook String
    myFortyTwoHook makeHook = makeHook "forty-two"
  fortyTwo <- myFortyTwoHook
  D.div_
    [ text fortyTwo ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')