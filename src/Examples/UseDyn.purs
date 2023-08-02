module Examples.UseDyn where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Foldable (for_)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDynAtBeginning_, useState')
import Deku.Listeners (click, keyUp)

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
app runExample = runExample Deku.do
  setItem /\ item <- useState'
  setInput /\ input <- useState'
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
            , keyUp \evt -> do
                when (code evt == "Enter") $
                  for_
                    ( (target >=> fromEventTarget)
                        (toEvent evt)
                    )
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
        { value: t } <- useDynAtBeginning_ item
        D.div_ [ text t ]
    ]