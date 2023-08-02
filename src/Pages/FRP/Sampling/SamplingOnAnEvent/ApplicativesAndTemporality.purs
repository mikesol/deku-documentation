module Pages.FRP.Sampling.SamplingOnAnEvent.ApplicativesAndTemporality where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider)
import Examples as Examples
import FRP.Event.Class ((<|**>))
import Router.ADT (Route(..))

applicativesAndTemporality :: Subsection
applicativesAndTemporality = subsection
  { title: "How sampling works"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text "We'll start our journey through sampling with "
          , D.code__ "sampleOnRight"
          , text " aka "
          , D.code__ "<|**>"
          , text ". The signature is: "
          ]
      , psCode
          """sampleOnRight :: forall a b. event a -> event (a -> b) -> event b"""
      , D.p_
          [ text
              "The function listens for changes to the event on the right, recalling the most recent value from the event on the left to produce a "
          , D.code__ "b"
          , text
              ". The event on the left, on the other hand, has no incedence on the emission of "
          , D.code__ "b"
          , text " with one exception - it must fire at least once so that "
          , D.code__ "b"
          , text " can be produced. That is, until it has fired, emissions of "
          , D.code__ "(a -> b)"
          , text " won't result in a "
          , D.code__ "b"
          , text " being emitted. Once an "
          , D.code__ "a"
          , text " is fired, each subequent "
          , D.code__ "(a -> b)"
          , text " will produce a "
          , D.code__ "b"
          , text "."
          ]
      , D.p__
          "To see this in action, let's concoct an example with two sliders. Both sliders do not emit an initial value, meaning they need to be moved in order for a value to be registered. Because of this, the system will only start producing values once both sliders have been moved, but it will only respond to the right slider. To see this, move the right (nothing), then the left (still nothing), then the right (bam!)."
      , psCodeWithLink Examples.HowSamplingWorks
      , exampleBlockquote
          [ Deku.do
              setSlider1 /\ slider1 <- useState'
              setSlider2 /\ slider2 <- useState'
              fixed
                [ D.div [klass "flex justify-around"]
                    [ D.input [slider setSlider1] []
                    , D.input [slider setSlider2] []
                    ]
                , text
                    ( slider1 <|**>
                        ((\a b -> show b <> " " <> show a) <$> slider2)
                    )
                ]
          ]
      , D.p_
          [ text "If you compare the defition of "
          , D.code__ "sampleOnRight"
          , text " to that of "
          , D.code__ "Behavior"
          , text " that we learned in "
          , routeLink Behaviors
          , text
              ", you'll see an interesting similarity. When an argument of type "
          , D.code__ "Event a"
          , text " is applied to "
          , D.code__ "sampleOnRight"
          , text " , it produces a "
          , D.code__ "Behavior"
          , text "."
          ]
      , psCode
          """type Behavior a = forall b. Event (a -> b) -> Event a
type SampleOnRight a =
  Event a -> (forall b. Event (a -> b) -> Event a)"""
      , D.p_
          [ text "This also allows us to write a definition for the "
          , D.code__ "step"
          , text " function we saw in the "
          , routeLink Behaviors
          , text " section."
          ]
      , psCode
          """step :: forall a. a -> Event a -> Behavior a
step a e = sampleOnRight (pure a <|> e)"""
      ]
  }
