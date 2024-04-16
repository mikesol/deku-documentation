module Pages.FRP.Events.Definition.TheTypeAndContract where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.DOM.Attributes as DA

import Deku.Control (text_)
import Deku.DOM as D

theTypeAndContract :: Subsection
theTypeAndContract = subsection
  { title: "The type constructor and contract"
  , matter: pure
      [ D.p_
          [ D.code__ "Event"
          , text_
              " is a type constructor that takes a type and returns a type. For example, you can have "
          , D.code__ "Event Int"
          , text_ ", "
          , D.code__ "Event String"
          , text_ ", or "
          , D.code__ "Event Unit"
          , text_
              " amongst others. There are several different implementations of "
          , D.code__ "Event"
          , text_
              " in PureScript, but the \"average\" definition is similar to the original definition of "
          , D.code__ "Event"
          , text_ " from the seminal 1997 paper "
          , D.a
              [ DA.href_ "http://conal.net/papers/icfp97/"
              , DA.target_ "blank"
              ]
              [ D.i__ "Functional reactive animation" ]
          , text_
              " by Paul Hudak and Conal Elliott. It's also similar to the definition used in the various Rx frameworks."
          ]
      , psCode """type Event a = (a -> Effect Unit) -> Effect (Effect Unit)"""
      , D.p_
          [ text_ "Let's unpack what this type is telling us, or its "
          , D.i__ "contract"
          , text_ ". The type is saying:"
          ]
      , D.blockquote_
          [ text_ "If you provide me with a way to report values of type "
          , D.code__ "a"
          , text_
              ", I'll provide you with a way to tell me to start and then stop reporting these values."
          ]
      , D.p_
          [ text_ "The \"reporter\" is the argument to the function of type "
          , D.code__ "(a -> Effect Unit)"
          , text_
              ". You can think of this as a walkie-talkie or self-addressed stamped envelope. It's what the producer of values uses to \"send the values back\" to the consumer."
          ]
      , D.p_
          [ text_
              "The notion of \"sending values back\" may sound counter-intuitive, especially if you're used to seeing patterns in functional programming where values of interest are "
          , D.i__ "outputs"
          , text_ " of functions and not inputs. Yet our value of type "
          , D.code__ "a"
          , text_
              " is not the output of any function: it is only an input. More specifically, it is the input into an opaque computational context with type "
          , D.code__ "Effect Unit"
          , text_ ". This "
          , D.code__ "Effect Unit"
          , text_
              " often represents a unit of work in a program during which actions like updating a DOM or printing to a console occur."
          ]
      , D.p_
          [ text_
              "Going back to the definition of our contract for "
          , D.code__ "Event"
          , text_ ", the right-hand side of the function is of type"
          , D.code__ "Effect (Effect Unit)"
          , text_ ". The two effects represent "
          , D.i__ "starting"
          , text_ " and "
          , D.i__ " stopping "
          , text_
              " the emission of events to the callback. When I left-bind on "
          , D.code__ "Effect (Effect Unit)"
          , text_ ", I'll get back an "
          , D.code__ "Effect Unit"
          , text_ " that's called an "
          , D.i__ "unsubscriber"
          , text_ " and events will start flowing to the callback "
          , D.code__ "(a -> Effect Unit)"
          , text_
              ". Then, when I left-bind (or discard) the unsubscriber of type "
          , D.code__ "Effect Unit"
          , text_ ", the event is asked to stop emitting new values to the "
          , D.code__ "(a -> Effect Unit)"
          , text_
              " callback."
          ]
      , D.p_
          [ text_
              "Whether the unsubscriber actually stops the flow of events is implementation specific. For example, on unsubscribe, an event may choose to emit several \"clean up\" instructions before stopping entirely. But in general, the unsubscribe function should turn off the faucet in a reasonable timeframe."
          ]
      ]
  }
