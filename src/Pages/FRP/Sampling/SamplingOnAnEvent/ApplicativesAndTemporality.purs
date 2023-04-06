module Pages.FRP.Sampling.SamplingOnAnEvent.ApplicativesAndTemporality where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (slider_)
import Examples as Examples
import FRP.Event.Class ((<|**>))
import Router.ADT (Route(..))

applicativesAndTemporality :: Subsection
applicativesAndTemporality = subsection
  { title: "How sampling works"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "We'll start our journey through sampling with "
          , D.code__ "sampleOnRight"
          , text_ " aka "
          , D.code__ "<|**>"
          , text_ ". The signature is: "
          ]
      , psCode
          """sampleOnRight :: forall a b. event a -> event (a -> b) -> event b"""
      , D.p_
          [ text_
              "The function listens for changes to the event on the right, recalling the most recent value from the event on the left to produce a "
          , D.code__ "b"
          , text_
              ". The event on the left, on the other hand, has no incedence on the emission of "
          , D.code__ "b"
          , text_ " with one exception - it must fire at least once so that "
          , D.code__ "b"
          , text_ " can be produced. That is, until it has fired, emissions of "
          , D.code__ "(a -> b)"
          , text_ " won't result in a "
          , D.code__ "b"
          , text_ " being emitted. Once an "
          , D.code__ "a"
          , text_ " is fired, each subequent "
          , D.code__ "(a -> b)"
          , text_ " will produce a "
          , D.code__ "b"
          , text_ "."
          ]
      , D.p__
          "To see this in action, let's concoct an example with two sliders. Both sliders do not emit an initial value, meaning they need to be moved in order for a value to be registered. Because of this, the system will only start producing values once both sliders have been moved, but it will only respond to the right slider. To see this, move the right (nothing), then the left (still nothing), then the right (bam!)."
      , psCodeWithLink Examples.HowSamplingWorks
      , exampleBlockquote
          [ Deku.do
              setSlider1 /\ slider1 <- useState'
              setSlider2 /\ slider2 <- useState'
              fixed
                [ D.div (klass_ "flex justify-around")
                    [ D.input (slider_ setSlider1) []
                    , D.input (slider_ setSlider2) []
                    ]
                , text
                    ( slider1 <|**>
                        ((\a b -> show b <> " " <> show a) <$> slider2)
                    )
                ]
          ]
      , D.p_
          [ text_ "If you compare the defition of "
          , D.code__ "sampleOnRight"
          , text_ " to that of "
          , D.code__ "Behavior"
          , text_ " that we learned in "
          , routeLink Behaviors
          , text_
              ", you'll see an interesting similarity. When an argument of type "
          , D.code__ "Event a"
          , text_ " is applied to "
          , D.code__ "sampleOnRight"
          , text_ " , it produces a "
          , D.code__ "Behavior"
          , text_ "."
          ]
      , psCode
          """type Behavior a = forall b. Event (a -> b) -> Event a
type SampleOnRight a =
  Event a -> (forall b. Event (a -> b) -> Event a)"""
      , D.p_
          [ text_ "This also allows us to write a definition for the "
          , D.code__ "step"
          , text_ " function we saw in the "
          , routeLink Behaviors
          , text_ " section."
          ]
      , psCode
          """step :: forall a. a -> Event a -> Behavior a
step a e = sampleOnRight (pure a <|> e)"""
      ]
  }
