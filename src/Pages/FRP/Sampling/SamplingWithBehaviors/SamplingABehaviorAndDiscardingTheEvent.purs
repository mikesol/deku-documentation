module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorAndDiscardingTheEvent where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquoteWithHeight)
import Contracts (Subsection, subsection)
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Deku.Control (text, text_)
import Deku.Control (text_)
import Deku.DOM as D
import FRP.Behavior (behavior, sample_)
import FRP.Event.Aff (bindToAffWithCancellation)
import FRP.Event.Time (interval)
import Fetch (Method(..))

example :: String
example =
  """module Main where

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
  )"""

samplingABehaviorAndDiscardingTheEvent
  :: forall lock payload. Subsection lock payload
samplingABehaviorAndDiscardingTheEvent = subsection
  { title: "Sampling a behavior and discarding the event"
  , matter: pure
      [ D.p_
          [ text_
              "We can also sample a behavior and discard the event via "
          , D.code__ "sample_"
          , text_
              ". Here's the same example above (with a bit slower of a rate to avoid killing the API!) using that technique."
          ]
      , psCode example
      , exampleBlockquoteWithHeight "h-96"
          [ text
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
          ]
      ]
  }
