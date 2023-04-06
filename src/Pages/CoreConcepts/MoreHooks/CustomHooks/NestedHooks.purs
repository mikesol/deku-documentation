module Pages.CoreConcepts.MoreHooks.CustomHooks.NestedHooks where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.Core (Hook)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMemoized, useState)
import Deku.Listeners (click)
import Effect (Effect)
import Examples as Examples
import FRP.Event (Event)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-pink-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-pink-700 focus:outline-none focus:ring-2
focus:ring-pink-500 focus:ring-offset-2 m-2""" :: String

nestedHooks :: Subsection
nestedHooks = subsection
  { title: "Deku dos and nested hooks"
  , matter: pure
      [ D.p_
          [ text_
              "What fun would custom hooks be if they couldn't nest other hooks? When nesting hooks, "
          , D.code__ "Deku.do"
          , text_ " is your friend."
          ]
      , psCodeWithLink Examples.NestedCustomHooks
      , exampleBlockquote
          [ Deku.do
              let
                hookusMinimus :: Int -> Hook ((Int -> Effect Unit) /\ Event Int)
                hookusMinimus i makeHook = Deku.do
                  setMinimus /\ minimus <- useState i
                  makeHook (setMinimus /\ minimus)

                hookusMaximus
                  :: Int
                  -> Hook ((Int -> Effect Unit) /\ Event Int /\ Event Int)
                hookusMaximus i makeHook = Deku.do
                  setMinimus /\ minimus <- hookusMinimus i
                  maximus <- useMemoized (add 1000 <$> minimus)
                  makeHook (setMinimus /\ minimus /\ maximus)
              setMinimus /\ minimus /\ maximus <- hookusMaximus 0
              D.div_
                [ D.button
                    Alt.do
                      klass_ buttonClass
                      click $ minimus <#> (add 1 >>> setMinimus)
                    [ text_ "Increment" ]
                , D.div_
                    [ text_ "Hookus minimus: "
                    , text (show <$> minimus)
                    ]
                , D.div_
                    [ text_ "Hookus maximus: "
                    , text (show <$> maximus)
                    ]
                ]
          ]
      ]
  }
