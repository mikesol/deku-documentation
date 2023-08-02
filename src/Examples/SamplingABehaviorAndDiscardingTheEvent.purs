module Examples.SamplingABehaviorAndDiscardingTheEvent where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal (new, read, write)
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Tuple (Tuple(..))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Aff (error, killFiber, launchAff)
import FRP.Behavior (behavior, sample_)
import FRP.Event.Time (interval)
import Fetch (Method(..))

main :: Effect Unit
main = do
  i <- interval 2000
  runInBody do
    text
      ( sample_
          ( behavior
              ( do
                  fiber <- new (pure unit)
                  value <- new "Fetching..."
                  pure $ Tuple (pure unit) do
                    fb <- launchAff do
                      f <- liftST $ read fiber
                      killFiber (error "cancelling") f
                      result <- AX.request
                        ( AX.defaultRequest
                            { url = "https://randomuser.me/api/"
                            , method = Left GET
                            , responseFormat = ResponseFormat.json
                            }
                        )
                      let ff s = liftST $ void $ write s value
                      case result of
                        Left err -> ff (AX.printError err)
                        Right response -> ff
                          (stringifyWithIndent 2 response.body)
                    liftST $ void $ write fb fiber
                    o <- liftST $ read value
                    pure ("Here's a random user: " <> o)
              )
          )

          i.event
      )