module Examples.OptimizedEventCreation where

import Prelude

import Control.Monad.ST.Internal (modify, new, read, run)
import Control.Monad.ST.Uncurried (mkSTFn1, runSTFn1, runSTFn2)
import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (createPureO, subscribePureO)

main :: Effect Unit
main = runInBody do
  text_ $ show $ run do
    { push, event } <- createPureO
    rf <- new 0
    _ <- runSTFn2 subscribePureO event $ mkSTFn1 \n -> do
      void $ modify (add n) rf
    runSTFn1 push 48
    runSTFn1 push 49
    runSTFn1 push 50
    read rf