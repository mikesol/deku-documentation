module Pages.FRP.Events.Definition.TheTypeAndContract where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Attribute ((:=))
import Deku.Attributes (href)
import Deku.Control (text)
import Deku.DOM as D

theTypeAndContract :: Subsection
theTypeAndContract = subsection
  { title: "The type constructor and contract"
  , matter: pure
      [ D.p_
          [ D.code__ "Event"
          , text
              " is a type constructor that takes a type and returns a type. For example, you can have "
          , D.code__ "Event Int"
          , text ", "
          , D.code__ "Event String"
          , text ", or "
          , D.code__ "Event Unit"
          , text
              " amongst others. There are several different implementations of "
          , D.code__ "Event"
          , text
              " in PureScript, but the \"average\" definition and the one we'll use going forward is similar to the original definition of "
          , D.code__ "Event"
          , text " from the seminal 1997 paper "
          , D.a
              [ href "http://conal.net/papers/icfp97/"
              , D.Target := "blank"
              ]
              [ D.i__ "Functional reactive animation" ]
          , text
              " by Paul Hudak and Conal Elliott. It's also similar to the definition used in the various Rx frameworks."
          ]
      , psCode """type Event a = (a -> Effect Unit) -> Effect (Effect Unit)"""
      , D.p_
          [ text "Let's unpack what this type is telling us, or its "
          , D.i__ "contract"
          , text ". The type is saying:"
          ]
      , D.blockquote_
          [ text "If you provide me with a way to report values of type "
          , D.code__ "a"
          , text
              ", I'll provide you with a way to tell me to start and then stop reporting these values."
          ]
      , D.p_
          [ text "The \"reporter\" is the argument to the function of type "
          , D.code__ "(a -> Effect Unit)"
          , text
              ". You can think of this as a walkie-talkie or self-addressed stamped envelope. It's what the producer of values uses to \"send the values back\" to the consumer."
          ]
      , D.p_
          [ text
              "The notion of \"sending values back\" may sound counter-intuitive, especially if you're used to seeing patterns in functional programming where values of interest are "
          , D.i__ "outputs"
          , text " of functions and not inputs. Yet our value of type "
          , D.code__ "a"
          , text
              " is not the output of any function: it is only an input. More specifically, it is the input into an opaque computational context with type "
          , D.code__ "Effect Unit"
          , text ". This "
          , D.code__ "Effect Unit"
          , text
              " often represents a unit of work in a program during which actions like updating a DOM or printing to a console occur."
          ]
      , D.p_
          [ text
              "Going back to the definition of our contract for "
          , D.code__ "Event"
          , text ", the right-hand side of the function is of type"
          , D.code__ "Effect (Effect Unit)"
          , text ". The two effects represent "
          , D.i__ "starting"
          , text " and "
          , D.i__ " stopping "
          , text
              " the emission of events to the callback. When I left-bind on "
          , D.code__ "Effect (Effect Unit)"
          , text ", I'll get back an "
          , D.code__ "Effect Unit"
          , text " that's called an "
          , D.i__ "unsubscriber"
          , text " and events will start flowing to the callback "
          , D.code__ "(a -> Effect Unit)"
          , text
              ". Then, when I left-bind (or discard) the unsubscriber of type "
          , D.code__ "Effect Unit"
          , text ", the event is asked to stop emitting new values to the "
          , D.code__ "(a -> Effect Unit)"
          , text
              " callback."
          ]
      , D.p_
          [ text
              "Whether the unsubscriber actually stops the flow of events is implementation specific. For example, on unsubscribe, an event may choose to emit several \"clean up\" instructions before stopping entirely. But in general, the unsubscribe function should turn off the faucet in a reasonable timeframe."
          ]
      ]
  }
