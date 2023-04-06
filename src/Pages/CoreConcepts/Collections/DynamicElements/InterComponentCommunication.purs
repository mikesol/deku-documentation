module Pages.CoreConcepts.Collections.DynamicElements.InterComponentCommunication where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Data.Foldable (for_, traverse_)
import Data.Int (floor)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Core (dyn)
import Deku.Core as Core
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn, useHot', useState, useState')
import Deku.Listeners (click, click_, keyUp)
import Examples as Examples
import FRP.Event.Class ((<|*>))
import QualifiedDo.Alt as Alt
import Router.ADT (Route(..))
import Web.Event.Event (target)
import Web.HTML (window)
import Web.HTML.HTMLInputElement (fromEventTarget, value, valueAsNumber)
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

interComponentCommunication :: Subsection
interComponentCommunication = subsection
  { title: "Inter-component communication"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_
              "Sometimes, you need to communicate between components in a dynamic structure. As we've seen in other examples, this possible by pushing to a hook at a higher level and subscribing to that hook at a lower level. However, because "
          , D.code__ "sendTo"
          , text_ " and "
          , D.code__ "remove"
          , text_ " are "
          , D.code__ "Effect"
          , text_ "s and not "
          , D.code__ "Event"
          , text_
              "s, we can only use them in a listener. If we want to use them in conjunction with a hook, like for example using a hook to delete all items, we need to "
          , D.code__ "alt"
          , text_ " our component with an event that contains either "
          , D.code__ "sendToPos"
          , text_ " and "
          , D.code__ "remove"
          , text_ " from the module "
          , D.code__ "Deku.Core"
          , text_ "."
          ]
      , psCodeWithLink Examples.InterComponentCommunication
      , exampleBlockquote
          [ Deku.do
              setPos /\ pos <- useState 0
              setItem /\ item <- useState'
              setRemoveAll /\ removeAll <- useState'
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
                    , D.input
                        Alt.do
                          klass_ inputKls
                          D.Xtype !:= "number"
                          D.Min !:= "0"
                          D.Value !:= "0"
                          D.OnChange !:= cb \evt ->
                            traverse_ (valueAsNumber >=> floor >>> setPos) $
                              (target >=> fromEventTarget) evt
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
                        ( \(Tuple p t) -> Alt.do
                            removeAll $> Core.remove
                            Deku.do
                              { sendTo, remove } <- useDyn p
                              D.div_
                                [ text_ t
                                , D.button
                                    Alt.do
                                      klass_ $ "ml-2 " <> buttonClass "indigo"
                                      click_ (sendTo 0)
                                    [ text_ "Prioritize" ]
                                , D.button
                                    Alt.do
                                      klass_ $ "ml-2 " <> buttonClass "pink"
                                      click_ remove
                                    [ text_ "Delete" ]
                                , D.button
                                    Alt.do
                                      klass_ $ "ml-2 " <> buttonClass "fuchsia"
                                      click_ (setRemoveAll unit)
                                    [ text_ "Remove all" ]
                                ]
                        )
                        (Tuple <$> pos <|*> item)
                ]
          ]
      , D.p_
          [ text_
              "Using these patterns, you can implement 99.87% of DOM business logic. We'll get to the remaining bits in the "
          , routeLink Portals
          , text_ " and "
          , routeLink CustomElements
          , text_ " sections."
          ]
      ]
  }
