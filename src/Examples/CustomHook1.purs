module Examples.CustomHook1 where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Deku.Control (text)
import Deku.Core (Hook)
import Deku.DOM as D
import Deku.Do as Deku

main :: ExampleSignature
main runExample = runExample Deku.do
  let
    myFortyTwoHook :: Hook String
    myFortyTwoHook makeHook = makeHook "forty-two"
  fortyTwo <- myFortyTwoHook
  D.div_
    [ text fortyTwo ]