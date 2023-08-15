module Pages.FRP.Polls.Applicative.PollsAsApplicatives where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

pollsAsApplicatives :: Subsection
pollsAsApplicatives = subsection
  { title: "Polls as applicatives"
  , matter: pure
      [ D.p_
          [ text_ "Because polls embody a measurement "
          , D.i__ " and "
          , text_
              " the potential duration of the measurement as well as the number of times the measurement occurs, the "
          , D.code__ "Apply"
          , text_
              " instance of poll needs to accumulate any additional effects added by the two incoming polls. In this way, it is similar to the "
          , D.code__ "Apply"
          , text_ " instance of "
          , D.code__ "Event"
          , text_ "."
          ]
      , D.p_
          [ text_ "The difference is that, while "
          , D.code__ "Event"
          , text_ "'s instance of "
          , D.code__ "Apply"
          , text_ " adds together incoming impulses "
          , D.code__ "Poll"
          , text_ " multiplies them. Or, in other words, if a "
          , D.code__ "Poll (a -> b)"
          , text_
              " adds adds three measurement for every one incoming measurement and "
          , D.code__ "Poll a"
          , text_
              " adds two impulses, the total number of resulting impulses is 6 instead of 5. The reason for this is that polls are functions on events, so the output of one becomes the input of another. We can see this in the definition of "
          , D.code__ "apply"
          , text_ " for a "
          , D.code__ "Poll"
          , text_ "."
          ]
      , psCode
          """apply (Poll f) (Poll a) =
            Poll \e -> a (f (compose <$> e))"""
      , D.p_
          [ text_
              "We can extend this analogy of sums and products even farther by looking at the "
          , D.code__ "Applicative"
          , text_ "instance of "
          , D.code__ "Poll"
          , text_ ". One can think of the "
          , D.code__ "Applicative"
          , text_ " instance of "
          , D.code__ "Event"
          , text_
              " as adding 0 new events when composed via "
          , D.code__ "apply"
          , text_
              " with another event. This is the identity law, stating that if an event fires 10 times, it should fire 10 times when composed with "
          , D.code__ "pure identity"
          , text_ ". In other words, it is the additive identity. In "
          , D.code__ "Poll a"
          , text_ ", on the other hand, we want "
          , D.code__ "pure"
          , text_ " to pass through an "
          , D.code__ "a"
          , text_
              " without creating any additional copies. In other words, it is the multiplicative identity."
          ]
      ]
  }
