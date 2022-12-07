module Examples.SamplingABehaviorAndDiscardingTheEvent where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (behavior, sample_)
import FRP.Event.Aff (bindToAffWithCancellation)
import FRP.Event.Time (interval)
import Fetch (Method(..))

main :: Effect Unit
main = runInBody do
  text
    ( sample_
        ( behavior
            ( \e -> bindToAffWithCancellation e
                ( \f -> do
                    result <- AX.request
                      ( AX.defaultRequest
                          { url = "https://randomuser.me/api/"
                          , method = Left GET
                          , responseFormat = ResponseFormat.json
                          }
                      )
                    pure $ f $ "Here's a random user: " <>
                      case result of
                        Left err -> (AX.printError err)
                        Right response ->
                          (stringifyWithIndent 2 response.body)
                )
            )
        )
        (interval 4038)
    )