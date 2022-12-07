module Examples.SamplingABehaviorWithAnEvent where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (behavior, sample)
import FRP.Event.Aff (bindToAffWithCancellation)
import FRP.Event.Time (interval)
import Fetch (Method(..))

main :: Effect Unit
main = runInBody do
  text
    ( sample
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
                    pure case result of
                      Left err -> f (AX.printError err)
                      Right response ->
                        f (stringifyWithIndent 2 response.body)
                )
            )
        )
        (interval 2000 $> ("Here's a random user: " <> _))
    )