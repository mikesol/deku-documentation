module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithACustomFunction where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquoteWithHeight)
import Contracts (Subsection, subsection)
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import FRP.Behavior (behavior, sampleBy)
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
import FRP.Behavior (behavior, sampleBy)
import FRP.Event.Aff (bindToAffWithCancellation)
import FRP.Event.Time (interval)
import Fetch (Method(..))

main :: Effect Unit
main = runInBody do
  text
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
  )"""

samplingABehaviorWithACustomFunction
  :: forall lock payload. Subsection lock payload
samplingABehaviorWithACustomFunction = subsection
  { title: "Sampling a behavior with a function"
  , matter: pure
      [ D.p_
          [ text_
              "Last but not least, we can sample an event with an arbitrary function using "
          , D.code__ "sampleBy"
          , text_ "."
          ]
      , psCode example
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
