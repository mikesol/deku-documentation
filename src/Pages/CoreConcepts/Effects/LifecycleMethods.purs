module Pages.CoreConcepts.Effects.LifecycleMethods where

import Prelude

import Contracts (Env(..), Section, getEnv, section)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.LifecycleMethods.Bravo (bravo)
import Pages.CoreConcepts.Effects.LifecycleMethods.EffectsOnInitialization (effectsOnInitialization)
import Router.ADT (Route(..))

lifecycleMethods :: Section
lifecycleMethods = section
  { title: "For game developers"
  , topmatter: do
      Env { routeLink } <- getEnv
      pure
        [ D.p_
            [ text_
                "If you're building a game with Deku, you're likely used to a different effect model than than the webapp-y one described above. Engines like Unity and Unreal provide two basic functions for "
            , D.code__ "GameObject"
            , text_ "s (Unity) or "
            , D.code__ "Actor"
            , text_ "s (Unreal). I'll use Unreal terminology below because:"
            ]
        , D.ul_
            [ D.li_
                [ D.code__ "BeginPlay"
                , text_ ": called when play begins for an actor."
                ]
            , D.li_
                [ D.code__ "Tick"
                , text_ ": called on each tick of the game loop."
                ]
            ]
        , D.p_
            [ D.code__ "BeginPlay"
            , text_
                " is of a different ilk than the casual(-ly cruel) one-off effects run on components' mounting and dismounting "
            , D.i__ "à la"
            , text_
                " React. It's integral to a game framework's logic. In functional programming, we call this an "
            , D.i__ "effect system"
            , text_
                ". That is, it's a predictable contract vis-à-vis side effects that's managed by some interpreter or engine."
            ]
        , D.p_
            [ text_ "We've already seen a Deku-ian effect system in the "
            , routeLink Providers
            , text_
                " section. Providers are a category of effects. The specific effect is that of "
            , D.i__ "providing"
            , text_
                " information to an otherwise pure component. In this section, we'll expand upon that notion to create an effect system with a "
            , D.code__ "BeginPlay"
            , text_ " function. "
            , D.i__ "In anger"
            , text_ ", Deku games often use this strategy."
            ]
        ]
  , subsections:
      [ effectsOnInitialization, {-effectsOnTeardown,-} bravo ]
  }
