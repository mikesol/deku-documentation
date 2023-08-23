module Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnInitialization where

import Prelude

import Assets (profileURL)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Examples as Examples

effectsOnInitialization :: Subsection
effectsOnInitialization = subsection
  { title: "Creating our effect system"
  , matter: do
      example <- getExample StartExpanded Nothing Examples.Game
      pure
        [ D.p_
            [ text_
                "Let's create a little game where a bunch of svg sprites move across the screen. Click them before they turn red to score points! If they turn red, you lose a point. Try not to dip below 0!"
            ]
        , example
        , D.p_
            [ text_
                "That example is a bit heftier than the other ones, clocking in at around 300 lines of code. But we've created a full-fledged game engine, so that's not "
            , D.i__ "that"
            , text_
                " bad. Even more improtantly, it cruises at 60fps and, on my Mac running on battery power with too many tabs open, barely eats up any of the scripting in the rendering loop, leaving ample headroom for experience (clicking around) and whatever else you wanna add to the game."
            ]
        , D.img [ DA.src_ profileURL ] []
        , D.p__ "Let's unpack what's going on."
        , D.ul_
            [ D.li_
                [ text_ "Just like Unreal, we have "
                , D.code__ "beginPlay"
                , text_ " and "
                , D.code__ "tick"
                , text_ " methods for our Actors."
                ]
            , D.li_
                [ text_ "We use the "
                , D.code__ "bindToST"
                , text_ " and "
                , D.code__ "thankTheDriver"
                , text_ " primitives from "
                , D.code__ "hyrule"
                , text_
                    ", the FRP package on which Deku is based, to turn our little actor into a "
                , D.code__ "Nut"
                , text_ "."
                ]
            , D.li_
                [ text_ "We make this "
                , D.code__ "Nut"
                , text_ " the object of a "
                , D.code__ "useDyn"
                , text_
                    ". The actors, at the end of the day, are just dynamic elements in a Deku app."
                ]
            ]
        ]
  }
