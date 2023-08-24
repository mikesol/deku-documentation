module Examples.BindToEffect where

import Prelude

import Control.Alt ((<|>))
import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (bindToEffect)
import FRP.Poll (dredge)
import Web.HTML (window)
import Web.HTML.Window (alert)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = runExample Deku.do
  setCount /\ count <- useState'
  D.div_
    [ D.button
        [ DA.klass_ buttonClass
        , DL.runOn DL.click $ (count <|> pure 0) <#> (add 1 >>> setCount)
        ]
        [ text_ "Increment" ]
    , D.div_
        [ text_ "The count: "
        , text $ dredge
            ( flip bindToEffect
                ( \i -> do
                    window >>= alert ("The count is " <> show i <> "!")
                    pure $ show i
                )
            )
            count
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')