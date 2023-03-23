module Pages.CoreConcepts.Collections.DynamicElements.InsertingInADifferentOrder where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.ProTip (proTip)
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
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn, useHot', useState, useState')
import Deku.Listeners (click, keyUp)
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

insertingInADifferentOrder :: forall lock payload. Subsection lock payload
insertingInADifferentOrder = subsection
  { title: "Inserting in a different order"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_
              "Sometimes, you want to insert elements in a particular order instead of the first element being inserted at the top of a list. There's a hook for that! Instead of "
          , D.code__ "useDyn_"
          , text_ " we'll use "
          , D.code__ "useDyn"
          , text_
              " followed by the position at which we want to insert. In the example below, this position is controlled by a numeric input."
          ]
      , psCodeWithLink Examples.InsertingInADifferentOrder
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
                        ( \(Tuple p t) -> Deku.do
                            _ <- useDyn p
                            D.div_ [ text_ t ]
                        )
                        (Tuple <$> pos <|*> item)
                ]
          ]
      , proTip
          { header:
              D.span_ [ text_ "The ", D.code__ "<|*>", text_ " operator" ]
          , message: D.div_
              [ text_ "In the example above, we see a new operator "
              , D.code__ "<|*>"
              , text_
                  ". We need to use it here because otherwise we'd add a todo item whenever we change the number in the input. This operator is part of a larger collection of operators used for "
              , routeLink Sampling
              , text_ ", which we'll go over later."
              ]
          }
      , D.p_
          [ text_
              "Note that, if the index overshoots or undershoots the collection's bounds, the element will go to the end or beginning of the collection respectively."
          ]
      ]
  }
