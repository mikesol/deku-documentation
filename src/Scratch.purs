module Scratch where

import Prelude

import Data.Foldable (oneOf, traverse_)
import Data.Int (floor)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute (cb, (!:=))
import Deku.Control (text_)
import Deku.Core (Nut, dyn)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn, useState, useState')
import Deku.Listeners (click, keyUp)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, value, valueAsNumber)
import Web.UIEvent.KeyboardEvent (code, toEvent)

data MainUIAction
  = AddTodo
  | ChangeText String

main :: Effect Unit
main = runInBody Deku.do
  setPos /\ pos <- useState 0
  setItem /\ item <- useState'
  setInput /\ input <- useState'
  let
    top :: Nut
    top =
      D.div_
        [ D.input
            ( oneOf
                [ keyUp $ pure \evt -> do
                    when (code evt == "Enter") $ do
                      traverse_ (value >=> setItem) $
                        (target >=> fromEventTarget) (toEvent evt)
                , D.SelfT !:= setInput
                ]
            )
            []
        , D.input
            ( oneOf
                [ D.Xtype !:= "number"
                , D.Min !:= "0"
                , D.Max !:= "10"
                , D.OnChange !:= cb \evt ->
                    traverse_ (valueAsNumber >=> floor >>> setPos) $
                      (target >=> fromEventTarget) evt
                ]
            )
            []
        , D.button
            (click $ input <#> (value >=> setItem))
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
            (Tuple <$> pos <*> item)
    ]

