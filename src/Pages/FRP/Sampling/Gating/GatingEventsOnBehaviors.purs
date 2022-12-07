module Pages.FRP.Sampling.Gating.GatingEventsOnBehaviors where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Control.Alt ((<|>))
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass)
import Deku.Control (text_)
import Deku.DOM as D
import FRP.Behavior (gateBy)
import FRP.Behavior.Time (instant)
import FRP.Event.Time (interval)
import Router.ADT (Route(..))

gatingEventsOnBehaviors :: forall lock payload. Subsection lock payload
gatingEventsOnBehaviors = subsection
  { title: "Gating events on behaviors"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "We can gate events on behaviors by using the "
          , D.code__ "gateBy"
          , text_ " function."
          ]
      , psCode
          """gateBy :: forall event p a. Filterable event => (p -> a -> Boolean) -> ABehavior event p -> event a -> event a
gateBy f ps xs = compact (sampleBy (\p x -> if f p x then Just x else Nothing) ps xs)"""
      , D.p_
          [ text_ "Let's use the same strobe example as in the "
          , routeLink Alternatives
          , text_
              " section, except we'll pause the strobe every two seconds via a gate. The current time will be provided by a "
          , D.code__ "Behavior"
          , text_ "."
          ]
      , psCode
          """module Main where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Number ((%))
import Deku.Attributes (klass)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Behavior (gateBy)
import FRP.Behavior.Time (instant)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  D.div
    ( klass
        ( gateBy
            (\t _ -> (unwrap $ unInstant t) % 4000.0 < 2000.0)
            instant
            ( (interval 200 $> "bg-pink-300") <|>
                (interval 165 $> "bg-green-300")
            )
        )
    )
    [ text_ "Par-tay!" ]"""
      , exampleBlockquote
          [ D.div
              ( klass
                  ( gateBy (\t _ -> (unwrap $ unInstant t) % 4000.0 < 2000.0)
                      instant
                      ( (interval 200 $> "bg-pink-300") <|>
                          (interval 165 $> "bg-green-300")
                      )
                  )
              )
              [ text_ "Par-tay!" ]
          ]
      ]
  }
