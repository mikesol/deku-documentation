module Examples.UnMemoizedApplication where

import Prelude

import Data.Array (intercalate, replicate)
import Data.Tuple (fst, snd)
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import QualifiedDo.Alt as Alt

main :: Effect Unit
main = runInBody Deku.do
  a <- useState true
  b <- useState false
  c <- useState true
  d <- useState false
  e <- useState true
  D.div_
    [ D.div_
        ( map
            ( \i -> D.a
                Alt.do
                  click $ snd i <#> not >>> fst i
                  klass_ "cursor-pointer"
                [ text_ "Click me " ]
            )
            [ a, b, c, d, e ]
        )
    , D.div_
        ( replicate 10
            ( D.div_
                [ text $
                    ( { a: _, b: _, c: _, d: _, e: _ }
                        <$> snd a
                        <*> snd b
                        <*> snd c
                        <*> snd d
                        <*> snd e
                    )
                      <#> \{ a, b, c, d, e } ->
                        intercalate " " $ map show
                          [ a, b, c, d, e ]
                ]
            )
        )
    ]