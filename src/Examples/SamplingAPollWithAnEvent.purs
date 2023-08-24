module Examples.SamplingAPollWithAnEvent where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Control.Alt ((<|>))
import Control.Monad.ST.Class (liftST)
import Control.Monad.ST.Internal (new, read, write)
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Deku.Control (text)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import Effect.Aff (error, killFiber, launchAff)
import Effect.Class (liftEffect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (makeEvent, subscribe)
import FRP.Event.Time (interval)
import FRP.Poll (poll, sample, sham)
import Fetch (Method(..))

app :: ExampleSignature
app runExample = do
  i <- interval 2000
  runExample do
    text
      ( sham
          ( sample
              ( pure "Fetching..." <|> poll \e -> makeEvent \k -> do
                  fiber <- new (pure unit)
                  subscribe e \ff -> do
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
                      liftEffect case result of
                        Left err -> k $ ff (AX.printError err)
                        Right response -> k $ ff
                          (stringifyWithIndent 2 response.body)
                    liftST $ void $ write fb fiber
              )

              (i.event $> ("Here's a random user: " <> _))
          )
      )

main :: Effect Unit
main = void $ app (map (map void) runInBody')