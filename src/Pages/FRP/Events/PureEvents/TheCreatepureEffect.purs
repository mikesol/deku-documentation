module Pages.FRP.Events.PureEvents.TheCreatepureEffect where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Control.Monad.ST.Internal (modify, new, read, run)
import Deku.Attributes (href_)
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples
import FRP.Event (createPure, subscribePure)
import Router.ADT (Route(..))

theCreatepureEffect :: Subsection
theCreatepureEffect = subsection
  { title: "The createPure effect"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "The "
          , D.code__ "createPure"
          , text_ " is the pure analog to the "
          , D.code__ "create"
          , text_ " effect and is defined like so."
          ]
      , psCode
          """createPure
  :: forall r a
  . ST r
    { event :: Event a
    , push :: a -> ST r Unit
    }"""
      , D.p__
          "It is used to create an event along with a pusher to which you can push values. Because it is interpreted in a pure context, we can use it to create a micro event-based system within our app, run the system, and collect the results without violating any laws of purity, like in the following example."
      , psCodeWithLink Examples.TheCreatePureEffect
      , exampleBlockquote
          [ text_ $ show $ run do
              { push, event } <- createPure
              rf <- new 0
              _ <- subscribePure event \n -> do
                void $ modify (add n) rf
              push 48
              push 49
              push 50
              read rf
          ]
      , D.p_
          [ text_ "Like we saw in "
          , D.a [href_ "#subscription-and-unsubscription-effects"]
              [ text_ "Subscription and unsubscription effects" ]
          , text_
              ", the control logic is \"backwards\" the heart of the logic is in the subscription whereas the values piped into the logic happen later on."
          ]
      , D.p_
          [ text_
              "In practice, you'll almost never need to create a pure event-based content unless you are running simulations or skimming off the pure bits of an otherwise effectful event-based system. In Deku, this is how "
          , routeLink SSR
          , text_
              " is done, which is why many custom event in Deku codebases are written in ST. That way, they can be rendered as an HTML string in order to make a static site."
          ]
      ]
  }
