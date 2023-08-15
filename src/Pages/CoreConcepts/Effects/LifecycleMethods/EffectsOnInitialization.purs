module Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnInitialization where

import Prelude

import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

effectsOnInitialization :: Subsection
effectsOnInitialization = subsection
  { title: "Effects on initialization"
  , matter: pure
      [ D.p_
          [ text_
              "The following two effects exist on component initialization. These are mostly useful for logging, debugging, and analytics, for example counting how many times a component is displayed on the screen."
          ]
      , D.table [ pure tableClass ]
          [ D.tr_
              [ D.th [ pure tableClass ] [ text_ "Name" ]
              , D.th [ pure tableClass ] [ text_ "Purpose" ]
              , D.th [ pure tableClass ] [ text_ "Signature" ]
              ]
          , D.tr_
              [ D.td [ pure tableClass ] [ D.code__ "onWillMount" ]
              , D.td [ pure tableClass ]
                  [ text_
                      "The effect will run before the component mounts on the screen."
                  ]
              , D.td [ pure tableClass ]
                  [ D.code__
                      """ Effect Unit -> Nut -> Nut"""
                  ]
              ]
          , D.tr_
              [ D.td [ pure tableClass ] [ D.code__ "onDidMount" ]
              , D.td [ pure tableClass ]
                  [ text_
                      "The effect will run directly after the component mounts on the screen."
                  ]
              , D.td [ pure tableClass ]
                  [ D.code__
                      """ Effect Unit -> Nut -> Nut"""
                  ]
              ]
          ]
      ]
  }
