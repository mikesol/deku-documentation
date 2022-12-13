module Pages.FRP.FixAndFold.FoldingEvents.TimeLeaks where

import Prelude

import Components.Code (psCodeNoCollapseWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Subsection, subsection)
import Control.Alt ((<|>))
import Control.Bind (bindFlipped)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Effect (Effect)
import Examples as Examples
import FRP.Event (Event, fix, fold, sampleOnRight)
import FRP.Event.Effect (bindToEffect)
import QualifiedDo.Alt as Alt
import Router.ADT (Route(..))

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

foldEBad :: forall a b. (b -> a -> Effect b) -> b -> Event a -> Event b
foldEBad f b e = flip bindToEffect identity $ fix \i ->
  (sampleOnRight (i <|> pure (pure b)) (e <#> bindFlipped <<< flip f))

foldEGood :: forall a b. (b -> a -> Effect b) -> b -> Event a -> Event b
foldEGood f b e = fix \i -> flip bindToEffect identity
  (sampleOnRight (i <|> pure b) (e <#> flip f))

timeLeaks :: forall lock payload. Subsection lock payload
timeLeaks = subsection
  { title: "Time leaks"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_
              "We've seen that fixed points can be dangerous because they lead to potentially infinite loops. But there's another, even more devious way that they're dangerous - "
          , D.i__ "time leaks"
          , text_ " ⌛😵‍💫."
          ]
      , D.p_
          [ text_
              "Time leaks is occur when the past has to be re-lived in its entirety to arrive at the present. As an example, consider the incrementing of a counter by one. There are two ways to think of this sequence:"
          ]
      , D.ul_
          [ D.li_ [ D.code__ "1 2 3 4 5 ..." ]
          , D.li_
              [ D.code__
                  "1 (1 + 1) (1 + 1 + 1) (1 + 1 + 1 + 1) (1 + 1 + 1 + 1 + 1)  ..."
              ]
          ]
      , D.p_
          [ text_
              "Even though these two representations of our counter are equivalent "
          , D.i__ "conceptually"
          , text_ ", they diverge "
          , D.i__ "computationally"
          , text_
              ". That is, the first example uses the result produced by the past to achieve the present, whereas the second example has to re-live the past step-by-step to get to the present."
          ]
      , D.p_
          [ text_
              "Of course, we want programs to be precise according to our intentions, so there are situations where we "
          , D.i__ "could"
          , text_
              " want to recompute the past in order to compute the present. But usually we don't. And thankfully, in functional programming, this concept is embodied by the notion of "
          , targetedLink
              "https://en.wikipedia.org/wiki/Referential_transparency"
              [ text_ "Referential transparency" ]
          , text_
              ". A referentially transparent expression can be replaced with its corresponding value, which is why a compiler can and does replace the prolix "
          , D.code__ "1 + 1 + 1 + 1 + 1"
          , text_ " with its terser homologue "
          , D.code__ "5"
          , text_ "."
          ]
      , D.p_
          [ text_
              "Time leaks come in two flavors. The benign flavor recomputes the past as an application runs, causing it to get progressively slower and eventually crash. At this point, recriminations ensue, someone reboots the server, and we all forget about it until the next time."
          ]
      , D.p_
          [ text_
              "A more insidious time leak occurs when the operation in question is not a pure function like addition but rather an effectful computation like debiting a bank account. Instead of repeating the procedure once (ie debiting 10 dollars) we wind up rerunning all of the procedures until the present one, potentially leading to catastrophic data loss."
          ]
      , D.p_
          [ text_
              "Let's see this in action. We'll set up two fixed points, one with a time leak and one without. Both fixed points will run an effectful computation on each tick, which will cause one counter to spin out of control whereas the other one stays tame."
          ]
      , psCodeNoCollapseWithLink Examples.FoldEffect
      , exampleBlockquote
          [ Deku.do
              setThunk1 /\ thunk1 <- useState unit
              setThunk2 /\ thunk2 <- useState unit
              setThunk3 /\ thunk3 <- useState unit
              setThunk4 /\ thunk4 <- useState unit
              let
                thunker p b _ = do
                  p unit
                  pure (b + 1)
              D.div_
                [ D.button
                    Alt.do
                      klass_ buttonClass
                      click_ do
                        setThunk1 unit
                        setThunk2 unit
                    [ text_ "Increment" ]
                , D.div_
                    [ text_ "Counter 1 using \"bad\" "
                    , D.code__ "foldE"
                    , text_ ": "
                    , text
                        (show <$> (foldEBad (thunker setThunk3) (-1) thunk1))
                    ]
                , D.div_
                    [ text_ "Counter 2 using \"good\" "
                    , D.code__ "foldE"
                    , text_ ": "
                    , text
                        (show <$> (foldEGood (thunker setThunk4) (-1) thunk2))
                    ]
                , D.div_
                    [ text_ "Result of \"bad\" "
                    , D.code__ "foldE has a time leak"
                    , text_ ": "
                    , text
                        (show <$> (fold (pure <$> add 1) (-1) thunk3))
                    ]
                , D.div_
                    [ text_ "Result of \"good\" "
                    , D.code__ "foldE behaves"
                    , text_ ": "
                    , text
                        (show <$> (fold (pure <$> add 1) (-1) thunk4))
                    ]
                ]
          ]
      , D.p_
          [ text_
              "Yikes, that's leakier than an abstraction created by an object-oriented programmer!"
          ]
      , D.p_
          [ text_
              "There's an important semantic distinction between the first and second examples that leads to this outcome. In the first example, we're creating a fixed point for a type of "
          , D.code__ "Effect b"
          , text_
              ". This is all well and good, but look at how we're using it. We're left binding it, then running an effectful computation "
          , D.code__ "f"
          , text_
              ", and then emitting the result. But as monads are just blueprints for programs yet to be executed, by continuously building off of the incoming "
          , D.code__ "Effect b"
          , text_ " to produce the new "
          , D.code__ "Effect b"
          , text_
              ", we are creating an ever-increasing blueprint. The result is that, when each one is interpreted, all of the effects up until the present are executed every time the event emits a value."
          ]
      , D.p_
          [ text_
              "In the second example, on the other hand, we don't have this problem: the incoming "
          , D.code__ "b"
          , text_
              " is a pure value so we do not need to left-bind on it. This is not to say that the "
          , D.code__ "Effect"
          , text_ "magically disappears - we still have to eliminate it via "
          , D.code__ "bindToEffect"
          , text_ ". But as we learned in the "
          , routeLink Effects
          , text_ " section, "
          , D.code__ "bindToEffect"
          , text_
              " \"swallows\" an effect into its event. This works more like a monadic bind or join, which does not accumulate effects but rather tacks on effects to a sequence."
          ]
      , D.p_
          [ text_
              "This difference is subtle, and unless you're an experienced FRP-er, it is difficult to repair time leaks, let alone spot them. And when you do, while you may get the eternal admiration of your FRP community, you will probably spend hours obsessively pouring over the problem that you could have spent doing other things. So, here's a list of ways to avoid time leaks:"
          ]
      , D.ul_
          [ D.li__
              "As much as possible, use primitives from your FRP library that already exist for these purposes. These have been heavily tested and vetted."
          , D.li_
              [ text_ "When possible, use "
              , D.code__ "Behavior"
              , text_
                  "s to separate out the read-only effectful parts of a computation from the pure ones. A behavior is a continuous function of time, so one way to think of anything effectful in FRP is how it is behaving at any given moment, be it a random-number generator or a "
              , D.code__ "GET"
              , text_
                  " request to an API. Sampling behaviors on events, doing some work, and then sampling more behaviors as you need them is not only a better way to write FRP - it makes the use of side effects crystal clear to those reading your code, which makes refactoring easier."
              ]
          , D.li_
              [ text_
                  "If (when) you're using Deku, do all of the effectful work in listeners like "
              , D.code__ "click"
              , text_ " or "
              , D.code__ "slider"
              , text_
                  ". For example, if you have a game state that updates whenever you click a button based on the previous game state and a current timestamp, this can be modeled as "
              , D.code__ "click $ state <#> \\s -> now >>= newState s"
              , text_ "."
              ]
          ]
      , D.p__
          "That being said, sometimes you just gotta write a time leak, if nothing else than to be reminded of the immense power you wield as a reactive programmer. Only by admiring, then loathing, then coming to terms with your abilities can you use them humbly in the world of mortals that we have no choice but to inhabit."
      ]
  }
