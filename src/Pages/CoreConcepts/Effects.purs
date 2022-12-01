module Pages.CoreConcepts.Effects where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Pushers (pushers)
import Pages.CoreConcepts.Effects.Hydration (hydration)
import Pages.CoreConcepts.Effects.LifecycleMethods (lifecycleMethods)
import Router.ADT (Route(..))

effects :: forall lock payload. Page lock payload
effects = page
  { route: Effects
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "How Deku manages side effects."
          ]
      , D.p_
          [ text_
              "If you're familiar with React or Halogen, the word \"effect\" is often used to refer to one of two related concepts:"
          ]
      , D.ul_
          [ D.li_
              [ text_ "Lifecycle effects ("
              , text_ "React"
              , text_ " | "
              , text_ "Halogen"
              , text_ ")."
              ]
          , D.li_
              [ text_ "Effect hooks ("
              , text_ "React"
              , text_ " | "
              , text_ "Halogen"
              , text_ ")."
              ]
          ]
      ]
  , sections:
      [ pushers, hydration, lifecycleMethods ]
  }
