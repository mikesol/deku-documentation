module Pages.CoreConcepts.Effects.Aff.TriggerAff where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.ProTip (proTip)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useAffWithCancellation, useState')
import Deku.Listeners (click)
import Effect.Class (liftEffect)
import Examples as Examples
import Fetch (Method(..), fetch)

triggerAff :: Subsection
triggerAff = subsection
  { title: "The useAffSequential hook"
  , matter: pure
      [ D.p_
          [ text
              "The following hook will emit an aff on each event. It does no cancellation, so if affs pile up, they will keep going until the element leaves the screen. If you're a glutton for punishment, click the link really fast ~20 times while watching your network tab."
          ]
      , psCodeWithLink Examples.RunningAffsSequentiallyInResponseToAnEvent
      , exampleBlockquote
          [ Deku.do
              setResponse /\ response <- useState'
              setClicked /\ clicked <- useState'
              useAffWithCancellation clicked \_ -> do
                { text: t } <- fetch "https://httpbin.org/post"
                  { method: POST
                  , body: """{"hello":"world"}"""
                  , headers: { "Content-Type": "application/json" }
                  }
                t >>= liftEffect <<< setResponse
              D.div_
                [ D.a
                      [click (setClicked unit),
                      klass "cursor-pointer"]
                    [ text "Click for a random http response" ]
                , text ": "
                , text ( show <$> response)
                ]
          ]
      , proTip
          { header:
              D.span_
                [ D.code__ "Aff", text "able asynchronicity in PureScript" ]
          , message: D.div_
              [ text
                  "Up until now, the side-effects we have seen have all been synchronous. In PureScript, we also have "
              , D.code__ "Aff"
              , text
                  " for asynchronous effects. You can think of them as "
              , targetedLink
                  "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise"
                  [ D.code__ "Promises" ]
              , text " that are meant to be broken (see "
              , targetedLink
                  "https://pursuit.purescript.org/packages/purescript-aff/5.1.2/docs/Effect.Aff#t:Canceler"
                  [ D.code__ "Canceler" ]
              , text "). "
              , D.code__ "liftEffect"
              , text " converts an "
              , D.code__ "Effect"
              , text "ful computation to an "
              , D.code__ "Aff"
              , text "ish ("
              , D.code__ "Aff"
              , text "ular? "
              , D.code__ "Aff"
              , text "erific?) computation and "
              , D.code__ "launchAff_"
              , text " takes an "
              , D.code__ "Aff"
              , text " and launches it from within an "
              , D.code__ "Effect"
              , text ", making that block run asynchronously."
              ]
          }
      ]
  }
