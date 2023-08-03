module Examples.MemoizedApplication where

import Prelude

import Data.Array (intercalate, replicate)
import Data.Tuple (fst, snd)
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMemoized, useState)
import Deku.Listeners (click)
import Deku.NonEmpty ((<**>))
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

app :: ExampleSignature
app runExample = runExample Deku.do
  aa <- useState true
  bb <- useState false
  cc <- useState true
  dd <- useState false
  ee <- useState true
  composedEvent <- useMemoized
    ( { a: _, b: _, c: _, d: _, e: _ }
        <$> snd aa
          <**> snd bb
          <**> snd cc
          <**> snd dd
          <**> snd ee
    )
  D.div_
    [ D.div_
        ( map
            ( \i -> D.a
                [ click $ snd i <#> not >>> fst i
                , klass "cursor-pointer"
                ]
                [ text "Click me " ]
            )
            [ aa, bb, cc, dd, ee ]
        )
    , D.div_
        ( replicate 10
            ( D.div_
                [ text $
                    ( composedEvent
                        <#> \{ a, b, c, d, e } ->
                          intercalate " " $ map show
                            [ a, b, c, d, e ]
                    )
                ]
            )
        )
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')