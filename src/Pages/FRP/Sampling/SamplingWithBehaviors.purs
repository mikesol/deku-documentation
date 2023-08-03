module Pages.FRP.Sampling.SamplingWithBehaviors where

import Prelude

import Components.ProTip (proTip)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Section, getEnv, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorAndDiscardingTheEvent (samplingABehaviorAndDiscardingTheEvent)
import Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithACustomFunction (samplingABehaviorWithACustomFunction)
import Pages.FRP.Sampling.SamplingWithBehaviors.SamplingABehaviorWithAnEvent (samplingABehaviorWithAnEvent)
import Router.ADT (Route(..))

samplingWithBehaviors :: Section
samplingWithBehaviors = section
  { title: "Sampling with behaviors"
  , topmatter: do
      Env { routeLink } <- getEnv
      pure [ D.p_
          [ text "As we saw in the section on "
          , routeLink Behaviors
          , text
              " , we need to sample a behavior on an event to see how it behaves. In this section, we'll go over the various behavior-sampling functions provided by "
          , D.code__ "purescript-hyrule"
          , text "."
          ]
      , proTip
          { header: text "Hyrule's history"
          , message: D.div_
              [ text "While we are using "
              , D.code__ "purescript-hyrule"
              , text
                  "as our FRP library of choice, most of them follow similar patterns. Hyrule, though, has a long history weaving through several packages. It is a fork of the archived "
              , targetedLink "https://github.com/paf31/purescript-event"
                  [ D.code__ "purescript-event" ]
              , text
                  ", which itself closely follows the original "
              , targetedLink "http://conal.net/papers/icfp97/"
                  [ text "FRAN paper by Hudak and Elliott" ]
              , text
                  ". So while these primitives aren't more interesting than other FRP ones, they have a rich history of being used in applications."
              ]
          }
      ]
  , subsections:
      [ samplingABehaviorWithAnEvent
      , samplingABehaviorAndDiscardingTheEvent
      , samplingABehaviorWithACustomFunction
      ]
  }
