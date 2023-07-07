module Pages.FRP.Events.OptimizedEvents where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Attributes (href_)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.FRP.Events.OptimizedEvents.OptimizedEventCreation (optimizedEventCreation)
import Pages.FRP.Events.OptimizedEvents.OptimizedEventFunctions (optimizedEventFunctions)

optimizedEvents :: Section
optimizedEvents = section
  { title: "Optimized events"
  , topmatter: pure
      [ D.p_
          [ text_
              "When you're making a game, you want to squeeze every ounce of of JavaScript that you can to hit 60 FPS. Deku, in combination with the "
          , D.a
              [href_
                  "https://github.com/aristanetworks/purescript-backend-optimizer"
                  , (D.Target !:= "_blank")
              ]
              [ D.code__ "purs-backend-optimizer" ]
          , text_
              " gets you 98% of the way there. For that extra two percent of juice, there are optimized events."
          ]
      , D.p_
          [ text_
              "Optimized events use special logic in the PureScript compiler to create mega super fast functions invocation in the "
          , D.code__ "ST r"
          , text_ " and "
          , D.code__ "Effect"
          , text_
              " monads. In the context of this documentation, they won't feel snappier than what you've seen so far because the small examples are all very fast. So to show the speed increases, we'll present the compiled JavaScript for all of the examples below and we'll indicate where the performance gains lie."
          ]
      ]
  , subsections:
      [ optimizedEventCreation, optimizedEventFunctions ]
  }
