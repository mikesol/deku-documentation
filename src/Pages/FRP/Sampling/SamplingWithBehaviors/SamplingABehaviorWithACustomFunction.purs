module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithACustomFunction where

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
import FRP.Behavior (behavior, sampleBy)
import FRP.Event.Time (interval)
import Fetch (Method(..))

samplingABehaviorWithACustomFunction
  :: Subsection
samplingABehaviorWithACustomFunction = subsection
  { title: "Sampling a behavior with a function"
  , matter: pure
      [ D.p_
          [ text
              "Last but not least, we can sample an event with an arbitrary function using "
          , D.code__ "sampleBy"
          , text "."
          ]
      , psCodeWithLink Examples.SamplingABehaviorWithACustomFunction
      , exampleBlockquoteWithHeight "h-96"
          [ text
              ( sampleBy (flip (<>))
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
                              pure $ f
                                case result of
                                  Left err -> (AX.printError err)
                                  Right response ->
                                    (stringifyWithIndent 2 response.body)
                          )
                      )
                  )
                  (interval 7562 $> "Here's a random user: ")
              )
          ]
      ]
  }
