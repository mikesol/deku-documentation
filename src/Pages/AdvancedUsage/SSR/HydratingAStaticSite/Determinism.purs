module Pages.AdvancedUsage.SSR.HydratingAStaticSite.Determinism where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_, (<#~>))
import Deku.DOM as D
import Effect.Random (random)
import FRP.Event.Effect (bindToEffect)
import Router.ADT (Route(..))

determinism :: Subsection
determinism = subsection
  { title: "Determinism"
  , matter: \(Env { routeLinkWithText }) ->
      [ D.p_
          [ text_
              "Deku, like the universe, is deterministic, meaning that for a given Deku site, the SSR will always be rendered in the same way. This includes the various comments in the DOM, which are cruicial for the hydration engine as it goes through and fills in effectful bits of your web app. So, make sure the same exact Deku component is used for "
          , D.code__ "hydrate"
          , text_ " as for "
          , D.code__ "runSSR"
          , text_ "."
          ]
      , D.p_
          [ text_
              "And on that rather mundane and protean note, I'd like to congratulate you for making it to the end of this documentation. But is this the end, or is it just a beginning? Perhaps it is the beginning of your journey making websites with Deku and Hyrule. Or the beginning of"
          , bindToEffect (pure unit) (const random) <#~> \n -> do
              let
                o
                  | n < 0.25 = targetedLink
                      "https://www.online-literature.com/tolstoy/anna_karenina/1/"
                      [ text_ "..." ]
                  | n < 0.5 = targetedLink "https://youtu.be/LZtkDf8VRbw?t=26"
                      [ text_ "..." ]
                  | n < 0.75 = targetedLink
                      "https://open.spotify.com/track/2Uy2EvsTSmLUK5WACUz7Rl"
                      [ text_ "..." ]
                  | otherwise = routeLinkWithText GettingStarted "..."
              o
          ]
      ]
  }
