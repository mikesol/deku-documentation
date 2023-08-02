module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorAndDiscardingTheEvent where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquoteWithHeight)
import Contracts (Subsection, subsection)
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import FRP.Behavior (behavior, sample_)
import FRP.Event.Time (interval)
import Fetch (Method(..))

samplingABehaviorAndDiscardingTheEvent
  :: Subsection
samplingABehaviorAndDiscardingTheEvent = subsection
  { title: "Sampling a behavior and discarding the event"
  , matter: pure
      [ D.p_
          [ text
              "We can also sample a behavior and discard the event via "
          , D.code__ "sample_"
          , text
              ". Here's the same example above (with a bit slower of a rate to avoid killing the API!) using that technique."
          ]
      , psCodeWithLink Examples.SamplingABehaviorAndDiscardingTheEvent
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
