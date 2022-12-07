module Pages.CoreConcepts.Collections.DynamicElements.TheUseDynHook where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Env(..), Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Foldable (for_)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Core (dyn)
import Deku.Do as Deku
import Deku.Hooks (useDyn_, useHot', useState')
import Deku.Listeners (click, keyUp)
import Web.Event.Event (target)
import Web.HTML (window)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.HTML.Window (alert)
import Web.UIEvent.KeyboardEvent (code, toEvent)
import QualifiedDo.Alt as Alt

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

example :: String
example =
  """module Main where

import Prelude

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Foldable (for_)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Core (dyn)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn_, useHot', useState')
import Deku.Listeners (click, keyUp)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Web.Event.Event (target)
import Web.HTML (window)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.HTML.Window (alert)
import Web.UIEvent.KeyboardEvent (code, toEvent)
import QualifiedDo.Alt as Alt

inputKls :: String
inputKls =
  """ <> tripleQ
    <>
      """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""
    <> tripleQ
    <>
      """


buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """
    <> tripleQ
    <>
      """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""
    <> tripleQ
    <>
      """

main :: Effect Unit
main = runInBody Deku.do
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
            Alt.do
                D.Value !:= "Tasko primo"
                keyUp $ pure \evt -> do
                    when (code evt == "Enter") $
                      for_
                        ((target >=> fromEventTarget)
                          (toEvent evt))
                        guardAgainstEmpty
                D.SelfT !:= setInput
                klass_ inputKls
            []
        , D.button
            Alt.do
              click $ input <#> guardAgainstEmpty
              klass_ $ buttonClass "green"
            [ text_ "Add" ]
        ]
  D.div_
    [ top
    , dyn $ item <#> \t -> Deku.do
        useDyn_
        D.div_ [ text_ t ]
    ]
"""

theUseDynHook :: forall lock payload. Subsection lock payload
theUseDynHook = subsection
  { title: "The useDyn hook"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "To render dynamic elements you'll need to do two things."
          ]
      , D.ol_
          [ D.li_
              [ text_ "Call the "
              , D.code__ "dyn"
              , text_
                  " function at the place you want a dynamic component. This will create space for the component in the DOM."
              ]
          , D.li_
              [ text_
                  "Provide the "
              , D.code__ "dyn"
              , text_ " function an "
              , D.code__ "Event"
              , text_ " of components that start with a "
              , D.code__ "useDyn_"
              , text_ " or "
              , D.code__ "useDyn"
              , text_ "directive."
              ]
          ]
      , D.p__ "Let's see some code!"
      , psCode example
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
                        Alt.do
                          D.Value !:= "Tasko primo"
                          keyUp $ pure \evt -> do
                            when (code evt == "Enter") $
                              for_
                                ((target >=> fromEventTarget) (toEvent evt))
                                guardAgainstEmpty
                          D.SelfT !:= setInput
                          klass_ inputKls
                        []
                    , D.button
                        Alt.do
                          click $ input <#> guardAgainstEmpty
                          klass_ $ buttonClass "green"
                        [ text_ "Add" ]
                    ]
              D.div_
                [ top
                , dyn
                    $ map
                        ( \t -> Deku.do
                            useDyn_
                            D.div_ [ text_ t ]
                        )
                        item
                ]
          ]
      , D.p_
          [ text_ "As we learned in "
          , routeLink State
          , text_ ", the right side of a state hook is of type "
          , D.code__ "Event a"
          , text_ ", where "
          , D.code__ "a"
          , text_ " is whatever's being pushed to the pusher. Because "
          , D.code__ "Event"
          , text_ " is a functor, we can "
          , D.code__ "map"
          , text_
              " over it. So far, we've been doing simple transformations like mapping over "
          , D.code__ "Event Int"
          , text_ " to turn it into "
          , D.code__ "Event String"
          , text_ ". Here, we're mapping over an "
          , D.code__ "Event"
          , text_
              " to transform it into a Deku component. So instead of streaming text to a text node, we're streaming components to the DOM, but it's the same pattern!"
          ]
      ]
  }
