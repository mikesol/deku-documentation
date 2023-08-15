module Pages.FRP.Polls.Definition.ThePollType where

import Prelude

import Components.Code (psCode)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

thePollType :: Subsection
thePollType = subsection
  { title: "The Poll type"
  , matter: pure
      [ D.p_
          [ text_ "The canonical definition of the poll type is:"
          ]
      , psCode """type Poll a = forall b. Event (a -> b) -> Event b"""
      , D.p_
          [ text_ "Like "
          , D.code__ "Event"
          , text
              " poll defines a contract. It's saying, \"If you give me any event that produces a "
          , D.code__ "b"
          , text_ " in exchange for an "
          , D.code__ "a"
          , text_ ", I'll give you a "
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
              "We consider this a continuous function of time because the poll is defined over the entire lifespan of the event. That is, no matter when "
          , D.code__ "Event (a -> b)"
          , text_ " emits an "
          , D.code__ "(a -> b)"
          , text_ ", we need to be able to supply an "
          , D.code__ "a"
          , text
              ". Or, in other words, at this point in time, we need to observe how "
          , D.code__ "a"
          , text_ " is "
          , D.b__ "behaving"
          , text_ " to produce a "
          , D.code__ "b"
          , text_ ". Thus the name poll!"
          ]
      , D.p_
          [ text
              "You may be tempted to ask, \"But isn't that just "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/docs/Data.Functor#v:flap"
              [ D.code__ "flap", text_ "ping" ]
          , text
              " over the incoming event to produce the outgoing event?\" If so, I encourage you to give in to temptation and ask! And since you asked, the answer is "
          , D.b__ "yes"
          , text_ ". This is a perfectly valid way to create a poll."
          ]
      , psCode "always42 :: Poll Int\nalways42 e = e <@> 42"
      , D.p_
          [ text
              "However, this is not the only way to create a poll. Polls encapsulate a broader notion than "
          , targetedLink "https://youtu.be/NdPlUjbiDoI?t=29"
              [ text_ "flapping" ]
          , text_ ". Poll "
          , D.i__ "also"
          , text_ " encapsulates two additional related concepts:"
          ]
      , D.ol_
          [ D.li__
              "The value being measured may require some sort of effectful lookup like making a network request; and"
          , D.li__
              "The poll may never return a result, in which case our event is muted."
          , D.li__
              "The poll may return multiple values by calling the callback of the resultant event multiple times."
          ]
      , D.p_
          [ text
              "This corresponds to the way observing actually work in the real world. For example, if we send a specialist to observe a daycare, it will take them time to make an observation, they might make several, and there's a non-trivial chance they won't make it out in one piece."
          ]
      , D.p_
          [ text
              "Therefore, even though polls are continuous functions of time, they effectively produce two pieces of information - a new value "
          , D.i__ "and"
          , text
              " a new point in time, which at the earliest is simultaneous to the emitted value and at the latest is never. Meaning that if you want to create a misbehaving poll, you can!"
          ]
      , psCode
          """proximalObservationOfABlackHole :: Poll Void
proximalObservationOfABlackHole _ = empty"""
      , D.p__
          "What other type allows you to peek into the void? This is why polls are awesome!"
      ]
  }
