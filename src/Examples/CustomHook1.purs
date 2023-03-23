module Examples.CustomHook1 where

import Prelude

import Deku.Control (text_)
import Deku.Core (Hook)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody Deku.do
  let
    myFortyTwoHook :: Hook String
    myFortyTwoHook makeHook = makeHook "forty-two"
  fortyTwo <- myFortyTwoHook
  D.div_
    [ text_ fortyTwo ]