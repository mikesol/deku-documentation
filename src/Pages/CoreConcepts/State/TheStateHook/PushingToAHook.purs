module Pages.CoreConcepts.State.TheStateHook.PushingToAHook where

import Components.Code (psCode)
import Contracts (Env(..), Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D
import Router.ADT (Route(..))

pushingToAHook :: Subsection
pushingToAHook = subsection
  { title: "Pushing to a hook"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text "As we saw in the "
          , routeLink Components
          , text
              " section, we can call an arbitrary effect, like raising an alert or writing to the console, from a listener like "
          , D.code__ "click"
          , text ". We can "
          , D.i__ "also"
          , text " push to a hook setter."
          ]
      , D.p_
          [ text "Let's have a look at the hook definition again." ]
      , psCode """setNumber /\ number <- useState n"""
      , D.p_
          [ text "Hook pushers (aka setters) are always on the "
          , D.i__ "left"
          , text
              " of the tuple returned from a hook. They always have the type "
          , D.code__ "a -> Effect Unit"
          , text ". In the example above "
          , D.code__ "a"
          , text " is a "
          , D.code__ "Number"
          , text
              ", but it could be a function, or an array, or really whatever you want to "
          , D.i__ "hook"
          , text " up to it."
          ]
      , D.p_
          [ text "Because pushers return something of type "
          , D.code__ "Effect Unit"
          , text
              " you can use them in any effectful context, including any Deku listener like "
          , D.code__ "OnClick"
          , text " or "
          , D.code__ "OnInput"
          , text ". In the example above, we generate a random number and use "
          , D.code__ "bind"
          , text ", aka "
          , D.code__ ">>="
          , text " to push the result to "
          , D.code__ "setNumber"
          , text "."
          ]
      , psCode """click $ random >>= setNumber"""
      ]
  }
