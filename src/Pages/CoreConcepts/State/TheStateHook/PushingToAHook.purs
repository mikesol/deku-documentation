module Pages.CoreConcepts.State.TheStateHook.PushingToAHook where

import Components.Code (psCode)
import Contracts (Env(..), Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

pushingToAHook :: forall lock payload. Subsection lock payload
pushingToAHook = subsection
  { title: "Pushing to a hook"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "As we say in the "
          , routeLink Components
          , text_
              " section, we can call an arbitrary effect, like raising an alert or writing to the console, from a listener like "
          , D.code__ "click"
          , text_ ". We can "
          , D.i__ "also"
          , text_ " push a hook setter."
          ]
      , D.p_
          [ text_ "Let's have a look at the hook definition again." ]
      , psCode """setNumber /\ number <- useState 0.42"""
      , D.p_
          [ text_ "Hook pushers (aka setters) are always on the "
          , D.i__ "left"
          , text_ " of the return value from a hook. They always have the type "
          , D.code__ "a -> Effect Unit"
          , text_ ", where "
          , D.code__ "a"
          , text_ " can be of any type. In the example above, it's a "
          , D.code__ "Number"
          , text_
              " but it could be a function, an array or really whatever you want to "
          , D.i__ "hook"
          , text_ " up to it."
          ]
      , D.p_
          [ text_ "Because pushers return something of type "
          , D.code__ "Effect Unit"
          , text_
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
      , psCode """click_ $ random >>= setNumber"""
      ]
  }
