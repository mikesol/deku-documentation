module Pages.FRP.Events.OptimizedEvents where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((:=))
import Deku.Attributes (href)
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Events.OptimizedEvents.OptimizedEventCreation (optimizedEventCreation)
import Pages.FRP.Events.OptimizedEvents.OptimizedEventFunctions (optimizedEventFunctions)

optimizedEvents :: Section
optimizedEvents = section
  { title: "Optimized events"
  , topmatter: pure
      [ D.p_
          [ text
              "When you're making a game, you want to squeeze every ounce of of JavaScript that you can to hit 60 FPS. Deku, in combination with the "
          , D.a
              [href
                  "https://github.com/aristanetworks/purescript-backend-optimizer"
                  , (D.Target := "_blank")
              ]
              [ D.code__ "purs-backend-optimizer" ]
          , text
              " gets you 98% of the way there. For that extra two percent of juice, there are optimized events."
          ]
      , D.p_
          [ text
              "Optimized events use special logic in the PureScript compiler to create mega super fast functions invocation in the "
          , D.code__ "ST r"
          , text " and "
          , D.code__ "Effect"
          , text
              " monads. In the context of this documentation, they won't feel snappier than what you've seen so far because the small examples are all very fast. So to show the speed increases, we'll present the compiled JavaScript for all of the examples below and we'll indicate where the performance gains lie."
          ]
      ]
  , subsections:
      [ optimizedEventCreation, optimizedEventFunctions ]
  }
