module Examples.RunSSR where

import Prelude

import Components.Code (htmlCode)
import Control.Monad.ST.Class (liftST)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Toplevel (runSSR)
import ExampleAssitant (ExampleSignature)

myApp :: String -> Nut
myApp s = D.div_
  [ D.h4__ "Hi!"
  , D.div__ "Here's some HTML for a Deku app:"
  , htmlCode s
  ]

main :: ExampleSignature
main runExample = do
  txt <- liftST $ runSSR (myApp "hello")
  runExample do myApp txt