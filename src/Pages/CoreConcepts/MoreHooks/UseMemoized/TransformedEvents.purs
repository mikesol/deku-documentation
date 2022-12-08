module Pages.CoreConcepts.MoreHooks.UseMemoized.TransformedEvents where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Array (intercalate, replicate)
import Data.Tuple (fst, snd)
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMemoized, useState)
import Deku.Listeners (click)
import Examples as Examples
import QualifiedDo.Alt as Alt

inputKls :: String
inputKls =
  """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""

transformedEvents :: forall lock payload. Subsection lock payload
transformedEvents = subsection
  { title: "From an event"
  , matter: pure
      [ D.p_
          [ text_
              "To make a more efficient version of the example above, we use the "
          , D.code__ "useMemoized"
          , text_ " hook."
          ]
      , psCodeWithLink Examples.MemoizedApplication
      , D.p__ "Resulting in the following example:"
      , exampleBlockquote
          [ Deku.do
              a <- useState true
              b <- useState false
              c <- useState true
              d <- useState false
              e <- useState true
              composedEvent <- useMemoized $ { a: _, b: _, c: _, d: _, e: _ }
                <$> snd a
                <*> snd b
                <*> snd c
                <*> snd d
                <*> snd e
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
                            [ text $ composedEvent
                                <#> \{ a, b, c, d, e } ->
                                  intercalate " " $ map show
                                    [ a, b, c, d, e ]
                            ]
                        )
                    )
                ]
          ]
      , D.p_
          [ text_ "Now, each subscription to "
          , D.code__ "composedEvent"
          , text_ " will draw from the "
          , D.i__ "same"
          , text_
              " event. This can help avoid lag, especially when working in a rendering loop that needs to execute at 60fps."
          ]
      ]
  }
