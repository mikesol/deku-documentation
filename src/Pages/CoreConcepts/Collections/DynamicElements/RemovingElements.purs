module Pages.CoreConcepts.Collections.DynamicElements.RemovingElements where

import Prelude

import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Foldable (for_, oneOf, traverse_)
import Data.Int (floor)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Core (Nut, dyn)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn, useState, useState', useHot')
import Deku.Listeners (click, keyUp)
import Effect.Console (log)
import FRP.Event.Class (sampleOnRightOp)
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

removingElements :: forall lock payload. Subsection lock payload
removingElements = subsection
  { title: "Removing elements"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Removing elements" ]
          , text_ "."
          ]
      , exampleBlockquote
          [ Deku.do
              setPos /\ pos <- useState 0
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
                        ( oneOf
                            [ keyUp $ pure \evt -> do
                                when (code evt == "Enter") $
                                  for_
                                    ((target >=> fromEventTarget) (toEvent evt))
                                    guardAgainstEmpty
                            , D.SelfT !:= setInput
                            , klass_ inputKls
                            ]
                        )
                        []
                    , D.input
                        ( oneOf
                            [ klass_ inputKls
                            , D.Xtype !:= "number"
                            , D.Min !:= "0"
                            , D.Max !:= "10"
                            , D.Value !:= "0"
                            , D.OnChange !:= cb \evt ->
                                traverse_ (valueAsNumber >=> floor >>> setPos) $
                                  (target >=> fromEventTarget) evt
                            ]
                        )
                        []
                    , D.button
                        (click $ input <#> guardAgainstEmpty)
                        [ text_ "Add" ]
                    ]
              D.div_
                [ top
                , dyn
                    $ map
                        ( \(Tuple p t) -> Deku.do
                            { remove, sendTo } <- useDyn p
                            D.div_
                              [ text_ t
                              , D.button
                                  (click $ pure (sendTo 0))
                                  [ text_ "Prioritize" ]
                              , D.button
                                  (click $ pure remove)
                                  [ text_ "Delete" ]
                              ]
                        )
                        (sampleOnRightOp (Tuple <$> pos) item)
                ]
          ]
      ]
  }
