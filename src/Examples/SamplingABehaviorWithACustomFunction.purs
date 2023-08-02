module Examples.SamplingABehaviorWithACustomFunction where

import Deku.Toplevel (runInBody')
import Effect (Effect)
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
import FRP.Behavior (behavior, sampleBy)
import FRP.Event.Time (interval)
import Fetch (Method(..))

app :: ExampleSignature
app runExample = do
  i <- interval 7562
  runExample do
    text
      ( sampleBy (flip append)
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

          (i.event $> "Here's a random user: ")
      )

main :: Effect Unit
main = void $ app (map (map void) runInBody')