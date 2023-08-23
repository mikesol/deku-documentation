module Examples.InsertingInADifferentOrder where

import Prelude

import Data.Foldable (for_, traverse_)
import Data.Int (floor)
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.DOM.Self as Self
import Deku.Do as Deku
import Deku.Hooks (useDyn, useRef, useState, useState')
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event.Class ((<|*>))
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

app :: ExampleSignature
app runExample = runExample.t Deku.do
  setPos /\ pos <- useState 0
  setItem /\ item <- useState'
  setInput /\ input <- useState'
  iref <- useRef Nothing (Just <$> input)
  let
    guardAgainstEmpty e = do
      v <- value e
      if v == "" then
        window >>= alert "Item cannot be empty"
      else setItem v
    top =
      D.div_
        [ D.input
            [ DA.value_ "Tasko primo"
            , DL.keyup_ $ \evt -> do
                when (code evt == "Enter") $
                  for_
                    ((target >=> fromEventTarget) (toEvent evt))
                    guardAgainstEmpty
            , Self.selfT_ setInput
            , DA.klass_ inputKls
            ]
            []
        , D.input
            [ DA.klass_ inputKls
            , DA.xtypeNumber
            , DA.min_ "0"
            , DA.value_ "0"
            , DL.numberOn_ DL.change (floor >>> setPos)
            ]
            []
        , D.button
            [ DL.click_ \_ -> do
                iref >>= traverse_ guardAgainstEmpty
            , DA.klass_ $ buttonClass "green"
            ]
            [ text_ "Add" ]
        ]
  D.div_
    [ top
    , Deku.do
        { value: t } <- useDyn
          (Tuple <$> pos <|*> item)
        D.div_ [ text_ t ]
    ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }