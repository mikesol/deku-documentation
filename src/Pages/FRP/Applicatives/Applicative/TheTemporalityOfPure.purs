module Pages.FRP.Applicatives.Applicative.TheTemporalityOfPure where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Data.Array (intercalate)
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import FRP.Event (fold)
import FRP.Event.Time (interval)
import Router.ADT (Route(..))

theTemporalityOfPure :: forall lock payload. Subsection lock payload
theTemporalityOfPure = subsection
  { title: "The temporality of pure"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "To define "
          , D.code__ "pure"
          , text_ " for events, we need a function whose signature is "
          , D.code__ "forall a. a -> Event a"
          , text_ " and that conforms to the applicative laws:"
          ]
      , D.ul_
          [ D.li_
              [ D.b__ "Identity"
              , text_ ": "
              , D.code__ "(pure identity) <*> v = v"
              ]
          , D.li_
              [ D.b__ "Composition"
              , text_ ": "
              , D.code__ "pure (<<<) <*> f <*> g <*> h = f <*> (g <*> h)"
              ]
          , D.li_
              [ D.b__ "Homomorphism"
              , text_ ": "
              , D.code__ "(pure f) <*> (pure x) = pure (f x)"
              ]
          , D.li_
              [ D.b__ "Interchange"
              , text_ ": "
              , D.code__ "u <*> (pure y) = (pure (_ $ y)) <*> u"
              ]
          ]
      , D.p_
          [ text_
              "So we need to pull a temporality out of thin air that will satisfy these four laws. What temporality should we choose? A single value that is emitted in 42 seconds? A value that is never emitted? A value that is emitted on the next browser tick after subscription? A value that is emitted immediately?"
          ]
      , D.p_
          [ text_
              "It's not at all obvious which one to choose, but it turns out that the only lawful implementation of "
          , D.code__ "pure"
          , text_ " is the one that emits a value immediately."
          ]
      , D.p_
          [ text_
              "Let's walk through the laws to verify that they're satisfied by our implementations of "
          , D.code__ "apply"
          , text_ " and "
          , D.code__ "pure"
          , text_ "."
          ]
      , D.ul_
          [ D.li_
              [ D.b__ "Identity"
              , text_
                  ": If we emit the identity function, it will necessarily arrive before the event on the right side as events are interpreted left-to-right, which means that it will apply to every future value on the right side."
              ]
          , D.li_
              [ D.b__ "Composition"
              , text_
                  ": The right side of composition preserves the temporality of all three events, favoring "
              , D.code__ "g"
              , text_ " over "
              , D.code__ "h"
              , text_ " due to the left-to-right rule and then favoring "
              , D.code__ "f"
              , text_ " over the applied result. Because "
              , D.code__ "pure (<<<)"
              , text_ " is applied to "
              , D.code__ "f"
              , text_ ", "
              , D.code__ "f"
              , text_ "'s temporality will remain unchanged. Furthermore, "
              , D.code__ "f"
              , text_ " still wins out over "
              , D.code__ "g"
              , text_ " and "
              , D.code__ "g"
              , text_ " still wins out over "
              , D.code__ "h"
              , text_
                  " in the left-to-right order, so we have the same tie-breaking mechanism for events in the same tick."
              ]
          , D.li_
              [ D.b__ "Homomorphism"
              , text_ ": this is the easiest to verify. Because "
              , D.code__ "pure"
              , text_
                  " will have the same temporality on the left and right regardless of its implementation, it will be homomorphic."
              ]
          , D.li_
              [ D.b__ "Interchange"
              , text_
                  ": This is the most interesting rule to verify because it is the only one that inverts the left-to-right order of its terms, which potentially changes the temporality of events during the same tick. It should be clear that, if "
              , D.code__ "u"
              , text_
                  " arrives any time after the initial browser tick, there will be no issue because the "
              , D.code__ "(pure y)"
              , text_ " and "
              , D.code__ "(pure (_ $ y)"
              , text_
                  " will be cached and used as soon as the value event from "
              , D.code__ "u"
              , text_ " is emitted. However, in the case where "
              , D.code__ "u"
              , text_
                  " also happens on the initial browser tick, we need to confirm that the order of application is irrelevant. Indeed, because "
              , D.code__ "pure"
              , text_
                  " has no other side effect aside from being emitted immediately, its presence on the right or left of "
              , D.code__ "u"
              , text_
                  " is immaterial, and as the final value will only be emitted once both events have fired at least once, the two formulations are equivalent."
              ]
          ]
      , D.div (klass_ "text-right") [ text_ "∎" ]
      , D.p_
          [ text_
              "Now that we've gotten that out of the way, let's do what y'all came here for - a giant fizz-bang using applicatives! Specifically, we'll use the fact that "
          , D.code__ "Event"
          , text_ "'s instance of "
          , D.code__ "Semigroup"
          , text_ " is defined as "
          , D.code__ "lift2 append"
          , text_ "."
          ]
          , psCode """module Main where

import Prelude

import Data.Array (intercalate)
import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (fold)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  let
    alternate e a b = fold (flip (const not)) true e
      <#> if _ then a else b
  text
    $ intercalate (pure " ")
        [ alternate (interval 804) "Functional" "Imperative"
        , pure "programming"
        , alternate (interval 1222) "is" "isn't"
        , alternate (interval 568) "fun!" "boring!"
        ]"""
      , exampleBlockquote
          [ let
              alternate e a b = fold (\b _ -> not b) true e <#>
                if _ then a else b
            in
              text
                $ intercalate (pure " ")
                    [ alternate (interval 804) "Functional" "Imperative"
                    , pure "programming"
                    , alternate (interval 1222) "is" "isn't"
                    , alternate (interval 568) "fun!" "boring!"
                    ]
          ]
      , D.p_
          [ text_ "Yet again, we see the ubiquitous "
          , D.code__ "fold"
          , text_
              " function. We'll get a full explanation of what it does once we reach "
          , routeLink FixAndFold
          , text_ "."
          ]
      ]
  }
