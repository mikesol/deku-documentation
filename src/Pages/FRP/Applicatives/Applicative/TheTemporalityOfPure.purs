module Pages.FRP.Applicatives.Applicative.PurityOutOfThinAir where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Data.Array (intercalate)
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples
import FRP.Event (fold)
import FRP.Event.Time (interval)
import Router.ADT (Route(..))

theTemporalityOfPure :: Subsection
theTemporalityOfPure = subsection
  { title: "The temporality of pure"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text "To define "
          , D.code__ "pure"
          , text " for events, we need a function whose signature is "
          , D.code__ "forall a. a -> Event a"
          , text " and that conforms to the applicative laws:"
          ]
      , D.ul_
          [ D.li_
              [ D.b__ "Identity"
              , text ": "
              , D.code__ "(pure identity) <*> v = v"
              ]
          , D.li_
              [ D.b__ "Composition"
              , text ": "
              , D.code__ "pure (<<<) <*> f <*> g <*> h = f <*> (g <*> h)"
              ]
          , D.li_
              [ D.b__ "Homomorphism"
              , text ": "
              , D.code__ "(pure f) <*> (pure x) = pure (f x)"
              ]
          , D.li_
              [ D.b__ "Interchange"
              , text ": "
              , D.code__ "u <*> (pure y) = (pure (_ $ y)) <*> u"
              ]
          ]
      , D.p_
          [ text
              "So we need to pull a temporality out of thin air that will satisfy these four laws. What temporality should we choose? A single value that is emitted in 42 seconds? A value that is never emitted? A value that is emitted on the next browser tick after subscription? A value that is emitted immediately?"
          ]
      , D.p_
          [ text
              "It's not at all obvious which one to choose, but it turns out that the only lawful implementation of "
          , D.code__ "pure"
          , text " is the one that emits a value immediately."
          ]
      , D.p_
          [ text
              "Let's walk through the laws to verify that they're satisfied by our implementations of "
          , D.code__ "apply"
          , text " and "
          , D.code__ "pure"
          , text "."
          ]
      , D.ul_
          [ D.li_
              [ D.b__ "Identity"
              , text
                  ": If we emit the identity function, it will necessarily arrive before the event on the right side as events are interpreted left-to-right, which means that it will apply to every future value on the right side."
              ]
          , D.li_
              [ D.b__ "Composition"
              , text
                  ": The right side of composition preserves the temporality of all three events, favoring "
              , D.code__ "g"
              , text " over "
              , D.code__ "h"
              , text " due to the left-to-right rule and then favoring "
              , D.code__ "f"
              , text " over the applied result. Because "
              , D.code__ "pure (<<<)"
              , text " is applied to "
              , D.code__ "f"
              , text ", "
              , D.code__ "f"
              , text "'s temporality will remain unchanged. Furthermore, "
              , D.code__ "f"
              , text " still wins out over "
              , D.code__ "g"
              , text " and "
              , D.code__ "g"
              , text " still wins out over "
              , D.code__ "h"
              , text
                  " in the left-to-right order, so we have the same tie-breaking mechanism for events in the same tick."
              ]
          , D.li_
              [ D.b__ "Homomorphism"
              , text ": this is the easiest to verify. Because "
              , D.code__ "pure"
              , text
                  " will have the same temporality on the left and right regardless of its implementation, it will be homomorphic."
              ]
          , D.li_
              [ D.b__ "Interchange"
              , text
                  ": This is the most interesting rule to verify because it is the only one that inverts the left-to-right order of its terms, which potentially changes the temporality of events during the same tick. It should be clear that, if "
              , D.code__ "u"
              , text
                  " arrives any time after the initial browser tick, there will be no issue because the "
              , D.code__ "(pure y)"
              , text " and "
              , D.code__ "(pure (_ $ y)"
              , text
                  " will be cached and used as soon as the value event from "
              , D.code__ "u"
              , text " is emitted. However, in the case where "
              , D.code__ "u"
              , text
                  " also happens on the initial browser tick, we need to confirm that the order of application is irrelevant. Indeed, because "
              , D.code__ "pure"
              , text
                  " has no other side effect aside from being emitted immediately, its presence on the right or left of "
              , D.code__ "u"
              , text
                  " is immaterial, and as the final value will only be emitted once both events have fired at least once, the two formulations are equivalent."
              ]
          ]
      , D.div [klass "text-right"] [ text "∎" ]
      , D.p_
          [ text
              "Now that we've gotten that out of the way, let's do what y'all came here for - a giant fizz-bang using applicatives! Specifically, we'll use the fact that "
          , D.code__ "Event"
          , text "'s instance of "
          , D.code__ "Semigroup"
          , text " is defined as "
          , D.code__ "lift2 append"
          , text "."
          ]
      , psCodeWithLink Examples.PurityOutOfThinAir
      , exampleBlockquote
          [ let
              alternate e a b = fold (pure <$> not) true e <#>
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
          [ text "Yet again, we see the ubiquitous "
          , D.code__ "fold"
          , text
              " function. We'll get a full explanation of what it does once we reach "
          , routeLink FixAndFold
          , text "."
          ]
      ]
  }
