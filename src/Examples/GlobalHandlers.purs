module Examples.GlobalHandlers where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Int (floor)
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import Effect.Ref (new, read, write)
import Effect.Timer (setTimeout)
import FRP.Event (create)

doAuth :: (Boolean -> Effect Unit) -> Effect (Effect Unit)
doAuth f = do
  onOff <- new true
  let
    eff tf = do
      oo <- read onOff
      when oo do
        f tf
        t <- random
        void $ setTimeout (floor $ t * 3000.0) (eff (not tf))
  eff false
  pure $ write false onOff

main :: Effect Unit
main = do
  authEvent <- liftST create
  runInBody
    ( text $ authEvent.event <#>
        if _ then "Welcome back!" else "Please log in."
    )
  _ <- doAuth authEvent.push
  pure unit