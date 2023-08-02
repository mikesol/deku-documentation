module Pages.FRP.FixAndFold.FoldingEvents.WhenToFixAndWhenToFold where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useDynAtBeginning, useState')
import Deku.Listeners (click)
import Examples as Examples
import FRP.Event (delay, fix, keepLatest)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

whenToFixAndWhenToFold :: Subsection
whenToFixAndWhenToFold = subsection
  { title: "When to fix and when to fold"
  , matter: pure
      [ D.p_
          [ D.i__ "In anger"
          , text
              ", as in these docs, we see much more folding than fixing. This is because the conceptual model of "
          , D.code__ "fold"
          , text
              ", namely, an event coupled with some state is so powerful that it suffices for most cases in a game or web application. However, "
          , D.code__ "fold"
          , text
              " presupposes a one-to-one relationship between events in and events out. Fixed points are, in fact, a more general category than that, allowing for arbitrary numbers of events out for every event in."
          ]
      , D.p_
          [ text
              "One classic example of this is "
          , targetedLink
              "https://en.wikipedia.org/wiki/Infinite_impulse_response"
              [ text "IIR filters" ]
          , text
              ", which generate a potentially infinite response from an initial impulse of energy. The equations for digital versions of these filters mix a signal with its output using a set of coefficients. Below, for example, we create an IIR filter for a "
          , targetedLink "https://en.wikipedia.org/wiki/Sawtooth_wave"
              [ text "Sawtooth wave" ]
          , text
              " and link the output of the wave to a time-delay. The system has a single input, "
          , D.code__ "pure 0"
          , text
              ", and generates all subsequent values from that initial impulse. As the delay goes up, the speed of the dots goes down, and when the sawtooth starts a new period, the speed quickens."
          ]
      , psCodeWithLink Examples.WhenToFixAndWhenToFold
      , exampleBlockquote
          [ Deku.do
              setSwitch /\ switch <- useState'
              D.div_
                [ D.div_
                    [ D.button
                        [ click (setSwitch unit)
                        , klass buttonClass
                        ]
                        [ text Alt.do
                            pure "Start simulation"
                            switch $> "Restart simulation"
                        ]
                    ]
                , switch <#~> \_ -> D.div [ klass "h-24 overflow-y-scroll" ]
                    [ Deku.do
                        _ <- useDynAtBeginning
                          ( fix
                              ( \e -> Alt.do
                                  keepLatest $ e <#> \n ->
                                    (delay <*> pure)
                                      if n >= 375 then 15 else n + 15
                                  pure 0
                              )
                          )
                        text "•​"
                    ]
                ]
          ]
      , D.p__
          "In addition to being great for games and for web apps, the FRP event-based architecture is also great for animations and simple physical models in the browser. Many animations, like the one above, do not require an animation loop and run entirely on timeouts. While less precise, this method frees up your UI thread."
      ]
  }
