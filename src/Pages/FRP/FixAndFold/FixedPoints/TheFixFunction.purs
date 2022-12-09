module Pages.FRP.FixAndFold.FixedPoints.TheFixFunction where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple (Tuple(..), fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click_)
import Examples as Examples
import FRP.Event (fix, sampleOnRight)
import Router.ADT (Route(..))

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2 mr-4"""

theFixFunction :: forall lock payload. Subsection lock payload
theFixFunction = subsection
  { title: "The fix function for events"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_
              "If we consider events as streams of values, one way to build intuition about "
          , D.code__ "fix"
          , text_
              " with respect to events is to think of streams that feed into each other in the natural world. Imagine you're at a sunny, warm beach. You dig a little canal from the sand down into the ocean and create a small loop for water to feed back into itself. Assuming that the water you pour into the canal has enough force when it reaches the loop, some particles will go around, rejoin the stream, and even potentially go around again before they empty into the ocean."
          ]
      , D.p_
          [ text_
              "While subscribing to events in the browser will never reach the volume of events as the ocean subscribing to the water molecules of your beach experiment, the idea is the same. Values from an event loop back into the same stream, reaching their final destination at a later time and perhaps with some transformation."
          ]
      , D.p_
          [ text_
              "As an example, let's write an event that feeds back into itself using "
          , D.code__ "fix"
          , text_
              ". We'll create a mechanism that lags by one event. That is, the first thing you click on will not change the value, and from then on, whenever you click, the previous value will be displayed."
          ]
      , psCodeWithLink Examples.ALagUsingFix
      , exampleBlockquote
          [ Deku.do
              setWord /\ word <- useState'
              D.div_
                [ D.div_ $
                    [ "Hickory" /\ "green"
                    , "Dickory" /\ "pink"
                    , "Dock" /\ "indigo"
                    ] <#> \(w /\ k) -> D.button
                      (klass_ (buttonClass k) <|> click_ (setWord w))
                      [ text_ w ]
                , D.div_
                    [ text_ "Previous word: "
                    , text
                        ( pure "None" <|>
                            ( compact $ snd <$> fix
                                ( \e -> sampleOnRight
                                    (pure Nothing <|> (fst <$> e))
                                    ((Tuple <<< Just) <$> word)
                                )
                            )
                        )
                    ]
                ]
          ]
      , D.p_
          [ text_
              "Before we delve into the inner workings of the function above, it's important to note that what we've just done is created "
          , D.b__ "State"
          , text_
              " in an event-based architecture. It's a pretty meager state - just remembering what happened one tick ago. But this mechanism will be the basis of all stateful work in events and will allow us to do a host of operations, from debouncing to folding."
          ]
      , D.p__
          "To understand how the fix mechanism work, let's first isolate the full event:"
      , psCode
          """compact $ snd <$> fix
  ( \e -> sampleOnRight
      (pure Nothing <|> (fst <$> e))
      ((Tuple <<< Just) <$> word)
  )"""
      , D.p__
          "From this definiton, we know that the event must be producing a tuple and that the second value of this tuple must be a "
      , D.code__ "Maybe String"
      , text_ " as it is compacted. So we can give a signature to the "
      , D.code__ "fix"
      , text_ " part:"
      , psCode
          """fixedEvent :: Event (Tuple ?hole (Maybe String))
fixedEvent = fix
  ( \e -> sampleOnRight
      (pure Nothing <|> (fst <$> e))
      ((Tuple <<< Just) <$> word)
  )"""
      , D.p_
          [ text_
              "To fill in the type hole, let's look at the inner function. We know that it must be a "
          , D.code__ "Maybe"
          , text_ " because it is "
          , D.code__ "alt"
          , text_ "ed with"
          , D.code__ "pure Nothing"
          , text_ ". So we can refine our hole as:"
          ]
      , psCode
          """fixedEvent :: Event (Tuple (Maybe ?hole) (Maybe String))
fixedEvent = fix
  ( \e -> sampleOnRight
      (pure Nothing <|> (fst <$> e))
      ((Tuple <<< Just) <$> word)
  )"""
      , D.p_
          [ text_ "To refine it further, let's look at the "
          , D.code__ "sampleOnRight"
          , text_
              " operation. We know that it must produce a tuple because the incoming event is a tuple, which means that the second argument to "
          , D.code__ "sampleOnRight"
          , text_ " must be of type "
          , D.code__ "Maybe String -> Tuple (Maybe ?hole) (Maybe String)"
          , text_
              ". Looking at the function, we see that it is filling in the left side of the tuple with "
          , D.code__ "Just word"
          , text_ ", and knowing that "
          , D.code__ "word"
          , text_ " is a "
          , D.code__ "String"
          , text_ ", we now know that the type of "
          , D.code__ "fixedEvent"
          , text_ " is "
          , D.code__ "Tuple (Maybe String) (Maybe String)"
          , text_ "."
          ]
      , D.p_
          [ text_ "From the section on "
          , routeLink Sampling
          , text_ ", we know that in "
          , D.code__ "sampleOnRight"
          , text_
              ", the right event will fire before the left event, creating a lag of one value. That means that the second value of the tuple will lag the first by one, and because it is hydrated with the incoming first value, it will always be the value of "
          , D.code__ "((Tuple <<< Just) <$> word)"
          , text_
              " from a previous event emission. Thus, this function works like a FIFO queue, with the value of "
          , D.code__ "word"
          , text_
              " starting at the left of the tuple and moving to the right before it falls off completely to make way for new values."
          ]
      , D.p__
          "To extend the example, we can use our fixed function as a building block to create lags of arbitrary depth."
      , psCodeWithLink Examples.SeveralLagsUsingFix
      , exampleBlockquote
          [ Deku.do
              setWord /\ word <- useState'
              let
                lag n e
                  | n <= 0 = e
                  | otherwise =
                      compact $ snd <$> fix
                        ( \ev -> sampleOnRight
                            (pure Nothing <|> (fst <$> ev))
                            ((Tuple <<< Just) <$> lag (n - 1) e)
                        )
              D.div_
                [ D.div_ $
                    [ "Hickory" /\ "green"
                    , "Dickory" /\ "pink"
                    , "Dock" /\ "indigo"
                    ] <#> \(w /\ k) -> D.button
                      (klass_ (buttonClass k) <|> click_ (setWord w))
                      [ text_ w ]
                , D.div_ $ [ 0, 1, 2, 3, 4 ] <#> \n -> D.div_
                    [ text_ $ "Word with a lag of " <> show n <> ": "
                    , text
                        (pure "None" <|> lag n word)
                    ]
                ]
          ]
      , D.p_
          [ text_
              "Using this technique, you can create powerful state machines that articulate arbitrary relationships between items in the past. So long as there is a sampling function that stops the fixed point from turning into an infinite loop, you can articulate any stateful behavior you so choose."
          ]
      ]
  }
