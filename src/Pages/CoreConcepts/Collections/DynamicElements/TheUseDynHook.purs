module Pages.CoreConcepts.Collections.DynamicElements.TheUseDynHook where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Data.Foldable (for_)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDynAtBeginning, useHot', useState')
import Deku.Listeners (click, keyUp)
import Examples as Examples
import Router.ADT (Route(..))
import Web.Event.Event (target)
import Web.HTML (window)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.HTML.Window (alert)
import Web.UIEvent.KeyboardEvent (code, toEvent)

inputKls :: String
inputKls =
  """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

theUseDynHook :: Subsection
theUseDynHook = subsection
  { title: "The useDyn hook"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text
              "To render dynamic components with the most recent component appearing at the top of a collection, look no further then the "
          , D.code__ "useDynAtBeginning"
          , text " hook. The hook takes an event outputs a value called "
          , D.code__ "value"
          , text
              " that can be used to render the most recent component. Here's an example:"
          ]
      , psCodeWithLink Examples.UseDyn
      , D.p__ "And here's the result."
      , exampleBlockquote
          [ Deku.do
              setItem /\ item <- useState'
              setInput /\ input <- useHot'
              let
                guardAgainstEmpty e = do
                  v <- value e
                  if v == "" then
                    window >>= alert "Item cannot be empty"
                  else setItem v
                top =
                  D.div_
                    [ D.input
                        [ D.Value := "Tasko primo"
                        , keyUp $ pure \evt -> do
                            when (code evt == "Enter") $
                              for_
                                ((target >=> fromEventTarget) (toEvent evt))
                                guardAgainstEmpty
                        , D.SelfT := setInput
                        , klass inputKls
                        ]
                        []
                    , D.button
                        [ click $ input <#> guardAgainstEmpty
                        , klass $ buttonClass "green"
                        ]
                        [ text "Add" ]
                    ]
              D.div_
                [ top
                , Deku.do
                    { value: t } <- useDynAtBeginning item
                    D.div_ [ text t ]
                ]
          ]
      , D.p_
          [ text "As we learned in "
          , routeLink State
          , text ", the right side of a state hook is of type "
          , D.code__ "Event a"
          , text ", where "
          , D.code__ "a"
          , text " is whatever's being pushed to the pusher. Because "
          , D.code__ "Event"
          , text " is a functor, we can "
          , D.code__ "map"
          , text
              " over it. So far, we've been doing simple transformations like mapping over "
          , D.code__ "Event Int"
          , text " to turn it into "
          , D.code__ "Event String"
          , text ". Here, we're mapping over an "
          , D.code__ "Event"
          , text
              " to transform it into a Deku component. So instead of streaming text to a text node, we're streaming components to the DOM, but it's the same pattern!"
          ]
      ]
  }
