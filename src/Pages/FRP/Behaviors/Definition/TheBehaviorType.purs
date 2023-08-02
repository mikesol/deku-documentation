module Pages.FRP.Behaviors.Definition.TheBehaviorType where

import Prelude

import Components.Code (psCode)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

theBehaviorType :: Subsection
theBehaviorType = subsection
  { title: "The Behavior type"
  , matter: pure
      [ D.p_
          [ text "The canonical definition of the behavior type is:"
          ]
      , psCode """type Behavior a = forall b. Event (a -> b) -> Event b"""
      , D.p_
          [ text "Like "
          , D.code__ "Event"
          , text
              " behavior defines a contract. It's saying, \"If you give me any event that produces a "
          , D.code__ "b"
          , text " in exchange for an "
          , D.code__ "a"
          , text ", I'll give you a "
          , D.code__ "b"
          , text
              " back.\" Importantly, to fulfill the contract, you don't know what "
          , D.code__ "b"
          , text
              " is, and yet you have to produce one. The only way we can do this, then, is with an "
          , D.code__ "a"
          , text
              "."
          ]
      , D.p_
          [ text
              "We consider this a continuous function of time because the behavior is defined over the entire lifespan of the event. That is, no matter when "
          , D.code__ "Event (a -> b)"
          , text " emits an "
          , D.code__ "(a -> b)"
          , text ", we need to be able to supply an "
          , D.code__ "a"
          , text
              ". Or, in other words, at this point in time, we need to observe how "
          , D.code__ "a"
          , text " is "
          , D.b__ "behaving"
          , text " to produce a "
          , D.code__ "b"
          , text ". Thus the name behavior!"
          ]
      , D.p_
          [ text
              "You may be tempted to ask, \"But isn't that just "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Data.Functor#v:flap"
              [ D.code__ "flap", text "ping" ]
          , text
              " over the incoming event to produce the outgoing event?\" If so, I encourage you to give in to temptation and ask! And since you asked, the answer is "
          , D.b__ "yes"
          , text ". This is a perfectly valid way to create a behavior."
          ]
      , psCode "always42 :: Behavior Int\nalways42 e = e <@> 42"
      , D.p_
          [ text
              "However, this is not the only way to create a behavior. Behaviors encapsulate a broader notion than "
          , targetedLink "https://youtu.be/NdPlUjbiDoI?t=29"
              [ text "flapping" ]
          , text ". Behavior "
          , D.i__ "also"
          , text " encapsulates two additional related concepts:"
          ]
      , D.ol_
          [ D.li__
              "The value being measured may require some sort of effectful lookup like making a network request; and"
          , D.li__
              "The behavior may never return a result, in which case our event is muted."
          , D.li__
              "The behavior may return multiple values by calling the callback of the resultant event multiple times."
          ]
      , D.p_
          [ text
              "This corresponds to the way observing actually work in the real world. For example, if we send a specialist to observe a daycare, it will take them time to make an observation, they might make several, and there's a non-trivial chance they won't make it out in one piece."
          ]
      , D.p_
          [ text
              "Therefore, even though behaviors are continuous functions of time, they effectively produce two pieces of information - a new value "
          , D.i__ "and"
          , text
              " a new point in time, which at the earliest is simultaneous to the emitted value and at the latest is never. Meaning that if you want to create a misbehaving behavior, you can!"
          ]
      , psCode
          """proximalObservationOfABlackHole :: Behavior Void
proximalObservationOfABlackHole _ = empty"""
      , D.p__
          "What other type allows you to peek into the void? This is why behaviors are awesome!"
      ]
  }
