module Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnInitialization where

import Prelude

import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

effectsOnInitialization :: Subsection
effectsOnInitialization = subsection
  { title: "Creating our effect system"
  , matter: pure
      [ D.p_
          [ text_
              "Let's create a little game where a bunch of svg sprites move across the screen and you have to click them to score points."
          ]
      , D.table [ tableClass ]
          [ D.tr_
              [ D.th [ tableClass ] [ text_ "Name" ]
              , D.th [ tableClass ] [ text_ "Purpose" ]
              , D.th [ tableClass ] [ text_ "Signature" ]
              ]
          , D.tr_
              [ D.td [ tableClass ] [ D.code__ "onWillMount" ]
              , D.td [ tableClass ]
                  [ text_
                      "The effect will run before the component mounts on the screen."
                  ]
              , D.td [ tableClass ]
                  [ D.code__
                      """ Effect Unit -> Nut -> Nut"""
                  ]
              ]
          , D.tr_
              [ D.td [ tableClass ] [ D.code__ "onDidMount" ]
              , D.td [ tableClass ]
                  [ text_
                      "The effect will run directly after the component mounts on the screen."
                  ]
              , D.td [ tableClass ]
                  [ D.code__
                      """ Effect Unit -> Nut -> Nut"""
                  ]
              ]
          ]
      ]
  }
