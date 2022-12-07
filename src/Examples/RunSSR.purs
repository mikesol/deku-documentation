module Examples.RunSSR where

import Prelude

import Components.Code (htmlCode)
import Control.Monad.ST (run)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Toplevel (runInBody, runSSR)
import Effect (Effect)

myApp :: forall lock payload. String -> Domable lock payload
myApp s = D.div_
  [ D.h4__ "Hi!"
  , D.div__ "Here's some HTML for a Deku app:"
  , htmlCode s
  ]

main :: Effect Unit
main = runInBody do
  myApp
    (run (runSSR (myApp "hello")))