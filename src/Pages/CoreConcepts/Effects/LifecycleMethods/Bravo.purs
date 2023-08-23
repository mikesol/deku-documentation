module Pages.CoreConcepts.Effects.LifecycleMethods.Bravo where

import Prelude

import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

bravo :: Subsection
bravo = subsection
  { title: "Bravo!"
  , matter: do
      Env { routeLink, routeLinkWithText } <- getEnv
      pure
        [ D.p_
            [ text_
                "Take a moment to congratulate yourself for how far you've come. Then, take "
            , D.i__ "two"
            , text_
                " moments to congratulate me on toiling over a hot computer for your edification. We've gone from some humble beginnings in "
            , routeLink HelloWorld
            , text_
                " to a full-fledged game!"
            ]
        , D.p_
            [ text_
                "At the end of the day, Deku is all about making games and musical instruments. Its design tradeoffs favor keeping your game at "
            , D.b__ "60fps"
            , text_
                " over whatever its blind spots are. It does this by eschewing the VDOM model in favor of something more reactive and snappy. At the same time, abstractions like hooks that originated in the VDOM world are easier to grok than reactive programming. When possible, the framework offers these abstractions to its devotees."
            ]
        , D.p_
            [ text_
                "Now that you've meticulously poured over and internalized all of the text and examples in this section, you're pretty far down the FRP rabbit hole. As the light of day recedes, you see that a cranny that may give way to a whole new chapter of this adventure. Against all reason, and certainly against the objections of your colleagues, friends, and family, you decide to keep going."
            ]
        , D.p_
            [ text_ "In the next section, you're going to learn about "
            , routeLinkWithText Events "Functional Reactive Programming"
            , text_
                ". It will elevate you from Deku Grand Master to an echelon of Deku prowess that is incomprehensible for those who have not attained it. Along the way, you will bend space-time, defy gravity, quantum-entangle and solve a Saturday NYT crossword puzzle. Read on!"
            ]
        ]
  }
