module Examples.MemoizedApplication where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.Array (intercalate, replicate)
import Data.NonEmpty (NonEmpty, (:|))
import Data.Tuple (fst, snd)
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMemoized, useState)
import Deku.Listeners (click)

apne
  :: forall f a b
   . Functor f
  => Apply f
  => NonEmpty f (a -> b)
  -> NonEmpty f a
  -> NonEmpty f b
apne (a' :| as') (b' :| bs') = a' b' :| (as' <*> bs')

infixl 4 apne as <**>

app :: ExampleSignature
app runExample = runExample Deku.do
  aa <- useState true
  bb <- useState false
  cc <- useState true
  dd <- useState false
  ee <- useState true
  let
    h :| t =
      ( { a: _, b: _, c: _, d: _, e: _ }
          <$> snd aa
          <**> snd bb
          <**> snd cc
          <**> snd dd
          <**> snd ee
      )
  composedEvent <- useMemoized t
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
                    ( h :| composedEvent
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