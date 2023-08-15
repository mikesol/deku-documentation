module Pages.CoreConcepts.MoreHooks.UseMemoized where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Section, getExample, section)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import Pages.CoreConcepts.MoreHooks.UseMemoized.InitialEvents (initialEvents)
import Pages.CoreConcepts.MoreHooks.UseMemoized.TransformedEvents (transformedEvents)

useMemoized :: Section
useMemoized = section
  { title: "The case for memoization"
  , topmatter: do
      example <- getExample StartCollapsed Nothing Examples.UnMemoizedApplication
      pure [ D.p_
          [ text_ "So far, we've worked with hooks like "
          , D.code__ "useState"
          , text_ " and "
          , D.code__ "useHot"
          , text_ " whose subscriptions are "
          , D.i__ "already"
          , text
              " memoized. That is, even if they do not memoize their event for instant replay (that's the difference bewteen "
          , D.code__ "useState"
          , text_ " and "
          , D.code__ "useHot"
          , text
              "), the subscriptions to the events are mutualized. That means that the same event acts as the source for all downstream consumers."
          ]
      , D.p_
          [ text
              "On the other hand, if you start working with events by composing them together, the subscriptions to those composed events "
          , D.i__ "will not"
          , text
              " be memoized. As an example, take the following snippet of code:"
          ]
      , example
      , D.p_
          [ text_ "Every line with "
          , D.code__ "true"
          , text_ "s and "
          , D.code__ "false"
          , text_ "s is responding to a "
          , D.i__ "different"
          , text_ " event with the following type:"
          ]
      , psCode
          """{ a :: Boolean
, b :: Boolean
, c :: Boolean
, d :: Boolean
, e :: Boolean
}"""
      , D.p_
          [ text
              "While each of these events will have the same content, computing them from their constituent events wastes precious CPU cycles and can be a drain on your app. To solve this, we use "
          , D.b__ "memoization"
          , text_ "."
          ]
      ]
  , subsections:
      [ transformedEvents, initialEvents ]
  }
