module Pages.CoreConcepts.Components.ASimpleComponent.WhatsInD where

import Prelude

import Router.ADT (Route(..))
import Components.Code (psCode)
import Contracts (Subsection, Env(..), subsection)
import Deku.Control (text_)
import Deku.DOM as D

whatsInD :: forall lock payload. Subsection lock payload
whatsInD = subsection
  { title: "What's in D?"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_
              "Compared to the imports from "
          , routeLink HelloWorld
          , text_ ", there's one additional import here worth noting."
          ]
      , psCode
          """import Deku.DOM as D"""
      , text_ "The "
      , D.code_ [ text_ "Deku.DOM" ]
      , text_
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
      , text_
          ". Basically, if it's in the DOM, it's in Deku, and if you can't find what you're looking for, you'll learn to add it in the "
      , routeLink CustomElements
      , text_ " section."
      ]
  }
