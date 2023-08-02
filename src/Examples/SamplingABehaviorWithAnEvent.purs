module Examples.SamplingABehaviorWithAnEvent where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal (new, read, write)
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Tuple (Tuple(..))
import Deku.Control (text)

import Effect.Aff (error, killFiber, launchAff)
import FRP.Behavior (behavior, sample)
import FRP.Event.Time (interval)
import Fetch (Method(..))

app :: ExampleSignature
app runExample = do
  i <- interval 2000
  runExample do
    text
      ( sample
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
                    liftST $ read value
              )
          )

          (i.event $> ("Here's a random user: " <> _))
      )