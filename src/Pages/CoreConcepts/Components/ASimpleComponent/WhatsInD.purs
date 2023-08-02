module Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD where

import Prelude

import Router.ADT (Route(..))
import Components.Code (psCode)
import Contracts (Subsection, Env(..), subsection)
import Deku.Control (text)
import Deku.DOM as D

whatsInD :: Subsection
whatsInD = subsection
  { title: "What's in D?"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text
              "Compared to the imports from "
          , routeLink HelloWorld
          , text ", there's one additional import here worth noting."
          ]
      , psCode
          """import Deku.DOM as D"""
      , text "The "
      , D.code_ [ text "Deku.DOM" ]
      , text
          " module is the kitchen sink into which the entire DOM is thrown. You can find your favorites like "
      , D.code_ [ text "D.li_" ]
      , text ", "
      , D.code_ [ text "D.h3_" ]
      , text ", and "
      , D.code_ [ text "D.blockquote_" ]
      , text ". You can even find exotic ones like the oft-overlooked "
      , D.code_ [ text "D.colgroup_" ]
      , text " and the pugnacious "
      , D.code_ [ text "D.noscript_" ]
      , text
          ". Basically, if it's in the DOM, it's in Deku, and if you can't find what you're looking for, you'll learn to add it in the "
      , routeLink CustomElements
      , text " section."
      ]
  }
