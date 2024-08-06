module Pages.CoreConcepts.MoreHooks.UseMemoized where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Section, getExample, section)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples
import Pages.CoreConcepts.MoreHooks.UseMemoized.Deflecting (deflecting)
import Pages.CoreConcepts.MoreHooks.UseMemoized.HotRants (hotRants)
import Pages.CoreConcepts.MoreHooks.UseMemoized.InitialEvents (initialEvents)
import Pages.CoreConcepts.MoreHooks.UseMemoized.TransformedEvents (transformedEvents)

useMemoized :: Section
useMemoized = section
  { title: "Goind on a rant"
  , topmatter: do
      example <- getExample StartCollapsed Nothing
        Examples.UnMemoizedApplication
      pure
        [ D.p_
            [ text_ "So far, we've worked with hooks like "
            , D.code__ "useState"
            , text_ " and "
            , D.code__ "useHot"
            , text_ " whose subscriptions are "
            , D.i__ "already"
            , text_
                " memoized. That means that the same event acts as the source for all downstream consumers."
            ]
        , D.p_
            [ text_
                "On the other hand, if you start working with events by composing them together, the subscriptions to those composed events "
            , D.i__ "will not"
            , text_
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
            [ text_
                "While each of these events will have the same content, computing them from their constituent events wastes precious CPU cycles and can be a drain on your app. To solve this, we use a form of "
            , D.b__ "memoization"
            , text_ " unique to polls called "
            , D.b__ "rant"
            , text_ "ing, and specifically the "
            , D.code__ "useRant"
            , text_ " hook."
            ]
        ]
  , subsections:
      [ transformedEvents, initialEvents, hotRants, deflecting ]
  }
