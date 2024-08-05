module Examples.SamplingAPollWithAnEvent where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Control.Alt ((<|>))
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Op (Op(..))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Aff (error, killFiber, launchAff)
import Effect.Class (liftEffect)
import Effect.Ref as Ref
import ExampleAssitant (ExampleSignature)
import FRP.Event.Time (interval')
import FRP.Poll (sham)
import Fetch (Method(..))

app :: ExampleSignature
app runExample = do
  fiber <- Ref.new (pure unit)
  apiz <- interval' (withAPICall fiber) 2000
  let quit = apiz.unsubscribe
  append <$> pure quit <*> runExample do
    text
      ( pure "Fetching..." <|>
          (pure "Here's a random user: " <> sham apiz.event)
      )

  where
  withAPICall :: forall a. _ -> Op (Effect Unit) String -> Op (Effect Unit) a
  withAPICall fiber (Op ff) = Op \_ -> do
    fb <- launchAff do
      f <- liftEffect $ Ref.read fiber
      killFiber (error "cancelling") f
      result <- AX.request
        ( AX.defaultRequest
            { url = "https://randomuser.me/api/"
            , method = Left GET
            , responseFormat = ResponseFormat.json
            }
        )
      liftEffect case result of
        Left err -> ff (AX.printError err)
        Right response -> ff
          (stringifyWithIndent 2 response.body)
    Ref.write fb fiber

main :: Effect Unit
main = void $ app runInBody