module Pages.CoreConcepts.State.TheStateHook.PushingToAHook where

import Prelude

import Components.Code (psCode)
import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D
import Router.ADT (Route(..))

pushingToAHook :: Subsection
pushingToAHook = subsection
  { title: "Pushing to a hook"
  , matter: do
      Env { routeLink } <- getEnv
      pure [ D.p_
          [ text_ "As we saw in the "
          , routeLink Components
          , text
              " section, we can call an arbitrary effect, like raising an alert or writing to the console, from a listener like "
          , D.code__ "click"
          , text_ ". We can "
          , D.i__ "also"
          , text_ " push to a hook setter."
          ]
      , D.p_
          [ text_ "Let's have a look at the hook definition again." ]
      , psCode """setNumber /\ number <- useState n"""
      , D.p_
          [ text_ "Hook pushers (aka setters) are always on the "
          , D.i__ "left"
          , text
              " of the tuple returned from a hook. They always have the type "
          , D.code__ "a -> Effect Unit"
          , text_ ". In the example above "
          , D.code__ "a"
          , text_ " is a "
          , D.code__ "Number"
          , text
              ", but it could be a function, or an array, or really whatever you want to "
          , D.i__ "hook"
          , text_ " up to it."
          ]
      , D.p_
          [ text_ "Because pushers return something of type "
          , D.code__ "Effect Unit"
          , text
              " you can use them in any effectful context, including any Deku listener like "
          , D.code__ "OnClick"
          , text_ " or "
          , D.code__ "OnInput"
          , text_ ". In the example above, we generate a random number and use "
          , D.code__ "bind"
          , text_ ", aka "
          , D.code__ ">>="
          , text_ " to push the result to "
          , D.code__ "setNumber"
          , text_ "."
          ]
      , psCode """click $ random >>= setNumber"""
      ]
  }
