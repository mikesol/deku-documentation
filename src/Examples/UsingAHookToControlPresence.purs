module Examples.UsingAHookToControlPresence where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Tuple.Nested ((/\))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, guard)
import Deku.DOM.Attributes as DA

import Deku.DOM.Listeners as DL

app :: ExampleSignature
app runExample = runExample Deku.do
  setPresence /\ presence <- useState true
  D.div_
    [ guard presence (text_ "Now you see me, ")
    , D.a
        [ DA.klass_ "cursor-pointer"
        , DL.runOn DL.click $ presence <#> not >>> setPresence
        ]
        [ text $ presence <#>
            if _ then "now you don't." else "Oops, come back!"
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')