module Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithAnEvent where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquoteWithHeight)
import Contracts (Subsection, subsection)
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Deku.Control (text, text_)
import Deku.Control (text, text_)
import Deku.Control (text_)
import Deku.DOM as D
import FRP.Behavior (behavior, sample)
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
    )"""

samplingABehaviorWithAnEvent :: forall lock payload. Subsection lock payload
samplingABehaviorWithAnEvent = subsection
  { title: "Sampling a behavior with an event"
  , matter: pure
      [ D.p_
          [ text_
              "The easiest way to sample a behavior with an event is to do what the signature of "
          , D.code__ "Behavior"
          , text_
              " is inviting, nay enticing us to do, namely function application."
          ]
      , psCode
          """type Behavior a = forall b. Event (a -> b) -> Event b
sample :: forall a b. Behavior a -> Event (a -> b) -> Event b
sample = ($)"""
      , D.p_ [ D.b__ "tl;dr - sampling behaviors = $" ]
      , D.p_
          [ text_
              "Here's an example of an event that consults a random behavior every two seconds. Note that the event sampling a \"random user behavior\", meaning that the conceptual model is that at any time the service is measured, there's always a random user."
          ]
      , psCode example
      , exampleBlockquoteWithHeight "h-96"
          [ text
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
          ]
      ]
  }
