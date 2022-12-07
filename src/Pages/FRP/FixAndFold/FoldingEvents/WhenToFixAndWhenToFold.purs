module Pages.FRP.FixAndFold.FoldingEvents.WhenToFixAndWhenToFold where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.TargetedLink (targetedLink)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_, (<#~>))
import Deku.Core (dyn)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn_, useState, useState')
import Deku.Listeners (click_)
import FRP.Event (delay, fix, keepLatest)
import QualifiedDo.Alt as Alt

example :: String
example =
  """module Main where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text_, text, (<#~>))
import Deku.Core (dyn)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDyn_, useState')
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (delay, fix, keepLatest)
import QualifiedDo.Alt as Alt

buttonClass =
  """ <> tripleQ
    <>
      """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6"""
    <> tripleQ
    <>
      """ :: String

main :: Effect Unit
main = runInBody Deku.do
  setSwitch /\ switch <- useState'
  D.div_
    [ D.div_
        [ D.button
            Alt.do
              click_ (setSwitch unit)
              klass_ buttonClass
            [ text Alt.do
                pure "Start simulation"
                switch $> "Restart simulation"
            ]
        ]
    , switch <#~> \_ -> D.div (klass_ "h-24 overflow-y-scroll")
        [ dyn
            ( fix
                ( \e -> Alt.do
                    keepLatest $ e <#> \n ->
                      (delay <*> pure)
                        if n >= 375 then 15 else n + 15
                    pure 0
                ) <#> \_ -> Deku.do
                useDyn_
                text_ "•​"
            )
        ]
    ]

"""

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

whenToFixAndWhenToFold :: forall lock payload. Subsection lock payload
whenToFixAndWhenToFold = subsection
  { title: "When to fix and when to fold"
  , matter: pure
      [ D.p_
          [ D.i__ "In anger"
          , text_
              ", as in these docs, we see much more folding than fixing. This is because the conceptual model of "
          , D.code__ "fold"
          , text_
              ", namely, an event coupled with some state is so powerful that it suffices for most cases in a game or web application. However, "
          , D.code__ "fold"
          , text_
              " presupposes a one-to-one relationship between events in and events out. Fixed points are, in fact, a more general category than that, allowing for arbitrary numbers of events out for every event in."
          ]
      , D.p_
          [ text_
              "One classic example of this is "
          , targetedLink
              "https://en.wikipedia.org/wiki/Infinite_impulse_response"
              [ text_ "IIR filters" ]
          , text_
              ", which generate a potentially infinite response from an initial impulse of energy. The equations for digital versions of these filters mix a signal with its output using a set of coefficients. Below, for example, we create an IIR filter for a "
          , targetedLink "https://en.wikipedia.org/wiki/Sawtooth_wave"
              [ text_ "Sawtooth wave" ]
          , text_
              " and link the output of the wave to a time-delay. The system has a single input, "
          , D.code__ "pure 0"
          , text_
              ", and generates all subsequent values from that initial impulse. As the delay goes up, the speed of the dots goes down, and when the sawtooth starts a new period, the speed quickens."
          ]
      , psCode example
      , exampleBlockquote
          [ Deku.do
              setSwitch /\ switch <- useState'
              D.div_
                [ D.div_
                    [ D.button
                        Alt.do
                          click_ (setSwitch unit)
                          klass_ buttonClass
                        [ text Alt.do
                            pure "Start simulation"
                            switch $> "Restart simulation"
                        ]
                    ]
                , switch <#~> \_ -> D.div (klass_ "h-24 overflow-y-scroll")
                    [ dyn
                        ( fix
                            ( \e -> Alt.do
                                keepLatest $ e <#> \n ->
                                  (delay <*> pure)
                                    if n >= 375 then 15 else n + 15
                                pure 0
                            ) <#> \_ -> Deku.do
                            useDyn_
                            text_ "•​"
                        )
                    ]
                ]
          ]
      , D.p__
          "In addition to being great for games and for web apps, the FRP event-based architecture is also great for animations and simple physical models in the browser. Many animations, like the one above, do not require an animation loop and run entirely on timeouts. While less precise, this method frees up your UI thread."
      ]
  }
