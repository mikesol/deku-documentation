module Pages.FRP.Sampling.SamplingWithPolls where

import Prelude

import Components.ProTip (proTip)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Section, getEnv, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Sampling.SamplingWithPolls.SamplingAPollAndDiscardingTheEvent (samplingAPollAndDiscardingTheEvent)
import Pages.FRP.Sampling.SamplingWithPolls.SamplingAPollWithACustomFunction (samplingAPollWithACustomFunction)
import Pages.FRP.Sampling.SamplingWithPolls.SamplingAPollWithAnEvent (samplingAPollWithAnEvent)
import Router.ADT (Route(..))

samplingWithPolls :: Section
samplingWithPolls = section
  { title: "Sampling with polls"
  , topmatter: do
      Env { routeLink } <- getEnv
      pure [ D.p_
          [ text_ "As we saw in the section on "
          , routeLink Polls
          , text_
              " , we need to sample a poll on an event to see how it behaves. In this section, we'll go over the various poll-sampling functions provided by "
          , D.code__ "purescript-hyrule"
          , text_ "."
          ]
      , proTip
          { header: text_ "Hyrule's history"
          , message: D.div_
              [ text_ "While we are using "
              , D.code__ "purescript-hyrule"
              , text_
                  "as our FRP library of choice, most of them follow similar patterns. Hyrule, though, has a long history weaving through several packages. It is a fork of the archived "
              , targetedLink "https://github.com/paf31/purescript-event"
                  [ D.code__ "purescript-event" ]
              , text_
                  ", which itself closely follows the original "
              , targetedLink "http://conal.net/papers/icfp97/"
                  [ text_ "FRAN paper by Hudak and Elliott" ]
              , text_
                  ". So while these primitives aren't more interesting than other FRP ones, they have a rich history of being used in applications."
              ]
          }
      ]
  , subsections:
      [ samplingAPollWithAnEvent
      , samplingAPollAndDiscardingTheEvent
      , samplingAPollWithACustomFunction
      ]
  }
