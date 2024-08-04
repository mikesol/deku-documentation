module Examples.TheUseDeflectHook where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (guard, useDeflect, useHot, useRant, useState, (<#~>))
import Deku.Toplevel (runInBody)
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
    thunkMe /\ thunked <- useState unit
    setPresence /\ presence <- useHot false
    let counter = fold (\a _ -> a + 1) 0 thunked
    deflected <- useDeflect counter
    ranted <- useRant counter
    let
      framed = D.div [ DA.klass_ "border-4" ]
        [ D.p_
            [ text $ deflected <#>
                show >>> ("Deflected: " <> _)
            ]
        , D.p_
            [ text $ ranted <#>
                show >>> ("Ranted: " <> _)
            ]
        , D.p_
            [ text $ counter <#>
                show >>> ("Normal: " <> _)
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
main = void $ app runInBody