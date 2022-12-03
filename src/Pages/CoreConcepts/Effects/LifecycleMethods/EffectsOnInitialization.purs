module Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnInitialization where

import Prelude

import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

effectsOnInitialization :: forall lock payload. Subsection lock payload
effectsOnInitialization = subsection
  { title: "Effects on initialization"
  , matter: pure
      [ D.p_
          [ text_ "The following two effects exist on component initialization. These are mostly useful for logging, debugging, and analytics, for example counting how many times a component is displayed on the screen."
          ]
      , D.table tableClass
          [ D.tr_
              [ D.th tableClass [ text_ "Name" ]
              , D.th tableClass [ text_ "Purpose" ]
              , D.th tableClass [ text_ "Signature" ]
              ]
          , D.tr_
              [ D.td tableClass [ D.code__ "onWillMount" ]
              , D.td tableClass
                  [ text_
                      "The effect will run before the component mounts on the screen."
                  ]
              , D.td tableClass
                  [ D.code__
                      """forall lock payload. Effect Unit -> Domable lock payload -> Domable lock payload"""
                  ]
              ]
          , D.tr_
              [ D.td tableClass [ D.code__ "onDidMount" ]
              , D.td tableClass
                  [ text_
                      "The effect will run directly after the component mounts on the screen."
                  ]
              , D.td tableClass
                  [ D.code__
                      """forall lock payload. Effect Unit -> Domable lock payload -> Domable lock payload"""
                  ]
              ]
          ]
      ]
  }
