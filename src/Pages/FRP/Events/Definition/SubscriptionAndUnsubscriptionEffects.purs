module Pages.FRP.Events.Definition.SubscriptionAndUnsubscriptionEffects where

import Prelude

import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Maybe (maybe)
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Effect (Effect)
import Effect.Console (error)
import Effect.Random (random)
import QualifiedDo.Alt as Alt
import Web.DOM (Element)
import Web.DOM.Document (createElement)
import Web.DOM.Element (toNode)
import Web.DOM.Node (appendChild)
import Web.HTML (window)
import Web.HTML.HTMLDocument (fromDocument, toDocument)
import Web.HTML.Window (document)

type Event a = (a -> Effect Unit) -> Effect (Effect Unit)

subscriptionAndUnsubscriptionEffects
  :: forall lock payload. Subsection lock payload
subscriptionAndUnsubscriptionEffects = subsection
  { title: "Subscription and unsubscription effects"
  , matter: pure
      [ D.p_
          [ text_
              "To get a better sense of how these subscription and unsubscription effects work in practice, let's create a small PureScript program that runs entirely on events. In doing so, we'll see how the event contract plays out step by step."
          ]
      , D.blockquote
          Alt.do
            klass_ "not-italic"
            D.Self !:= \bquote -> do
              doc <- window >>= document <#> toDocument
              anchor0 <- createElement "a" doc
              anchor1 <- createElement "a" doc
              div <- createElement "div" doc
              n <- random
              appendChild (toNode bquote) (toNode anchor0)
              appendChild (toNode bquote) (toNode anchor1)
              appendChild (toNode bquote) (toNode div)
              pure unit
          []
      ]
  }
