module Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD where

import Prelude

import Components.Code (psCode)
import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D
import Router.ADT (Route(..))

whatsInD :: Subsection
whatsInD = subsection
  { title: "What's in D?"
  , matter: do
      Env { routeLink } <- getEnv
      pure [ D.p_
          [ text
              "Compared to the imports from "
          , routeLink HelloWorld
          , text_ ", there's one additional import here worth noting."
          ]
      , psCode
          """import Deku.DOM as D"""
      , text_ "The "
      , D.code_ [ text_ "Deku.DOM" ]
      , text
          " module is the kitchen sink into which the entire DOM is thrown. You can find your favorites like "
      , D.code_ [ text_ "D.li_" ]
      , text_ ", "
      , D.code_ [ text_ "D.h3_" ]
      , text_ ", and "
      , D.code_ [ text_ "D.blockquote_" ]
      , text_ ". You can even find exotic ones like the oft-overlooked "
      , D.code_ [ text_ "D.colgroup_" ]
      , text_ " and the pugnacious "
      , D.code_ [ text_ "D.noscript_" ]
      , text
          ". Basically, if it's in the DOM, it's in Deku, and if you can't find what you're looking for, you'll learn to add it in the "
      , routeLink CustomElements
      , text_ " section."
      ]
  }
