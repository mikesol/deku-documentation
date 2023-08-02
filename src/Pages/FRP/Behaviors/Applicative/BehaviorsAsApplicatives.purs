module Pages.FRP.Behaviors.Applicative.BehaviorsAsApplicatives where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

behaviorsAsApplicatives :: Subsection
behaviorsAsApplicatives = subsection
  { title: "Behaviors as applicatives"
  , matter: pure
      [ D.p_
          [ text "Because behaviors embody a measurement "
          , D.i__ " and "
          , text
              " the potential duration of the measurement as well as the number of times the measurement occurs, the "
          , D.code__ "Apply"
          , text
              " instance of behavior needs to accumulate any additional effects added by the two incoming behaviors. In this way, it is similar to the "
          , D.code__ "Apply"
          , text " instance of "
          , D.code__ "Event"
          , text "."
          ]
      , D.p_
          [ text "The difference is that, while "
          , D.code__ "Event"
          , text "'s instance of "
          , D.code__ "Apply"
          , text " adds together incoming impulses "
          , D.code__ "Behavior"
          , text " multiplies them. Or, in other words, if a "
          , D.code__ "Behavior (a -> b)"
          , text
              " adds adds three measurement for every one incoming measurement and "
          , D.code__ "Behavior a"
          , text
              " adds two impulses, the total number of resulting impulses is 6 instead of 5. The reason for this is that behaviors are functions on events, so the output of one becomes the input of another. We can see this in the definition of "
          , D.code__ "apply"
          , text " for a "
          , D.code__ "Behavior"
          , text "."
          ]
      , psCode
          """apply (Behavior f) (Behavior a) =
            Behavior \e -> a (f (compose <$> e))"""
      , D.p_
          [ text
              "We can extend this analogy of sums and products even farther by looking at the "
          , D.code__ "Applicative"
          , text "instance of "
          , D.code__ "Behavior"
          , text ". One can think of the "
          , D.code__ "Applicative"
          , text " instance of "
          , D.code__ "Event"
          , text
              " as adding 0 new events when composed via "
          , D.code__ "apply"
          , text
              " with another event. This is the identity law, stating that if an event fires 10 times, it should fire 10 times when composed with "
          , D.code__ "pure identity"
          , text ". In other words, it is the additive identity. In "
          , D.code__ "Behavior a"
          , text ", on the other hand, we want "
          , D.code__ "pure"
          , text " to pass through an "
          , D.code__ "a"
          , text
              " without creating any additional copies. In other words, it is the multiplicative identity."
          ]
      ]
  }
