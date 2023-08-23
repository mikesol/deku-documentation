module Examples.RunSSR where

import Prelude

import Control.Monad.ST.Class (liftST)
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.Toplevel (runInBody', runSSR)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

htmlCode :: String -> Nut
htmlCode code = D.pre [ DA.klass_ "prism-code language-markup" ]
  [ D.code_ [ text_ code ] ]

myApp :: String -> Nut
myApp s = D.div_
  [ D.h4__ "Hi!"
  , D.div__ "Here's some HTML for a Deku app:"
  , htmlCode s
  ]

app :: ExampleSignature
app runExample = do
  txt <- liftST $ runSSR (myApp "hello")
  runExample.t do myApp txt

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }