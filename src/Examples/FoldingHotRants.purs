module Examples.FoldingHotRants where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (guard, useHot, useHotRant, useState', (<#~>))
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (fold)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

app :: ExampleSignature
app runExample = do
  runExample Deku.do
    thunkMe /\ thunked <- useState'
    setPresence /\ presence <- useHot false
    let counter = fold (\a _ -> a + 1) 0 thunked
    ranted <- useHotRant counter
    let
      framed = D.div [ DA.klass_ "border-4" ]
        [ D.p_
            [ text_ "Ranted: "
            , text $ show <$> ranted
            ]
        , D.p_
            [ text_ "Normal: "
            , text $ show <$> counter
            ]
        ]
    D.div_
      [ D.button
          [ DA.klass_ buttonClass
          , DL.click_ \_ -> thunkMe unit
          ]
          [ text_ "Update number" ]
      , ranted <#~> \_ -> D.button
          [ DA.klass_ buttonClass
          , DL.runOn DL.click $ presence <#> not >>> setPresence
          ]
          [ text $ presence <#> if _ then "Hide" else "Show" ]
      , framed
      , guard presence framed
      ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')