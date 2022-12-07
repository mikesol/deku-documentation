module Examples.TheCreatePureEffect where

import Prelude

import Deku.Toplevel (runInBody)
import Effect (Effect)

import Control.Monad.ST.Internal (modify, new, read, run)
import Deku.Control (text_)
import FRP.Event (createPure, subscribePure)

main :: Effect Unit
main = runInBody do
  text_ $ show $ run do
    { push, event } <- createPure
    rf <- new 0
    _ <- subscribePure event \n -> do
      void $ modify (add n) rf
    push 48
    push 49
    push 50
    read rf