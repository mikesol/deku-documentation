module Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnTeardown where

import Prelude

import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

effectsOnTeardown :: Subsection
effectsOnTeardown = subsection
  { title: "Effects on teardown"
  , matter: pure
      [ D.p_
          [ text
              "There's only one effect for component teardown. This effect runs after the component is completely unmounted. It is useful for logging and debugging in addition to situations where you want to be extra-careful in doing idempotent cleanup, for example closing audio contexts."
          ]
      , D.table [ tableClass ]
          [ D.tr_
              [ D.th [ tableClass ] [ text "Name" ]
              , D.th [ tableClass ] [ text "Purpose" ]
              , D.th [ tableClass ] [ text "Signature" ]
              ]
          , D.tr_
              [ D.td [ tableClass ] [ D.code__ "onDismount" ]
              , D.td [ tableClass ]
                  [ text
                      "The effect will run directly after the component is removed from the screen."
                  ]
              , D.td [ tableClass ]
                  [ D.code__
                      """ Effect Unit -> Nut -> Nut"""
                  ]
              ]
          ]
      ]
  }
