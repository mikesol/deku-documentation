module Examples.NestedCustomHooks where

import Deku.Toplevel (runInBody)
import Prelude

import Data.NonEmpty (NonEmpty, head, tail, (:|))
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Core (Hook)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMemoized, useState)
import Deku.Listeners (click)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (Event)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-pink-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-pink-700 focus:outline-none focus:ring-2
focus:ring-pink-500 focus:ring-offset-2 m-2""" :: String

main :: ExampleSignature
main runExample = runExample Deku.do
  let
    hookusMinimus :: Int -> Hook ((Int -> Effect Unit) /\ NonEmpty Event Int)
    hookusMinimus i makeHook = Deku.do
      setMinimus /\ minimus <- useState i
      makeHook (setMinimus /\ minimus)

    hookusMaximus
      :: Int
      -> Hook ((Int -> Effect Unit) /\ NonEmpty Event Int /\ NonEmpty Event Int)
    hookusMaximus i makeHook = Deku.do
      setMinimus /\ minimus <- hookusMinimus i
      let added = add 1000 <$> minimus
      maximus <- useMemoized (tail added)
      makeHook (setMinimus /\ minimus /\ (head added :| maximus))
  setMinimus /\ minimus /\ maximus <- hookusMaximus 0
  D.div_
    [ D.button
        [ klass buttonClass
        , click $ minimus <#> (add 1 >>> setMinimus)
        ]
        [ text "Increment" ]
    , D.div_
        [ text "Hookus minimus: "
        , text (show <$> minimus)
        ]
    , D.div_
        [ text "Hookus maximus: "
        , text (show <$> maximus)
        ]
    ]
