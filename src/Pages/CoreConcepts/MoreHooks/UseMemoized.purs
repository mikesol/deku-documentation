module Pages.CoreConcepts.MoreHooks.UseMemoized where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Section, section)
import Data.Array (intercalate, replicate)
import Data.Tuple (fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Pages.CoreConcepts.MoreHooks.UseMemoized.InitialEvents (initialEvents)
import Pages.CoreConcepts.MoreHooks.UseMemoized.TransformedEvents (transformedEvents)
import QualifiedDo.Alt as Alt

useMemoized :: forall lock payload. Section lock payload
useMemoized = section
  { title: "Use memoized"
  , topmatter: pure
      [ D.p_
          [ text_ "So far, we've worked with hooks like "
          , D.code__ "useState"
          , text_ " and "
          , D.code__ "useHot"
          , text_ " whose subscriptions are "
          , D.i__ "already"
          , text_
              " memoized. That is, even if they do not memoize their event for instant replay (that's the difference bewteen "
          , D.code__ "useState"
          , text_ " and "
          , D.code__ "useHot"
          , text_
              "), the subscriptions to the events are mutualized. That means that the same source acts as the source for all downstream consumers."
          ]
      , D.p_
          [ text_
              "If you start working with events by composing them together, then subscriptions to the composed events "
          , D.i__ "will not"
          , text_
              " be memoized. As an example, take the following snippet of code:"
          ]
      , psCode
          """Deku.do
  a <- useState true
  b <- useState false
  c <- useState true
  d <- useState false
  e <- useState true
  D.div_
    [ D.div_
        ( map
            ( \i -> D.a 
                Alt.do
                  click $ snd i <#> not >>> fst i
                  klass_ "cursor-pointer"
                [ text_ "Click me " ]
            )
            [ a, b, c, d, e ]
        )
    , D.div_
        ( replicate 10
            ( D.div_
                [ text $
                    ( { a: _, b: _, c: _, d: _, e: _ }
                        <$> snd a
                        <*> snd b
                        <*> snd c
                        <*> snd d
                        <*> snd e
                    )
                      <#> \{ a, b, c, d, e } ->
                        intercalate " " $ map show
                          [ a, b, c, d, e ]
                ]
            )
        )
    ]
"""
      , D.p__ "Resulting in the following example:"
      , exampleBlockquote
          [ Deku.do
              a <- useState true
              b <- useState false
              c <- useState true
              d <- useState false
              e <- useState true
              D.div_
                [ D.div_
                    ( map
                        ( \i -> D.a
                            Alt.do
                              click $ snd i <#> not >>> fst i
                              klass_ "cursor-pointer"
                            [ text_ "Click me " ]
                        )
                        [ a, b, c, d, e ]
                    )
                , D.div_
                    ( replicate 10
                        ( D.div_
                            [ text $
                                ( { a: _, b: _, c: _, d: _, e: _ }
                                    <$> snd a
                                    <*> snd b
                                    <*> snd c
                                    <*> snd d
                                    <*> snd e
                                )
                                  <#> \{ a, b, c, d, e } ->
                                    intercalate " " $ map show
                                      [ a, b, c, d, e ]
                            ]
                        )
                    )
                ]
          ]
      , D.p_
          [ text_ "Every line with "
          , D.code__ "true"
          , text_ "s and "
          , D.code__ "false"
          , text_ "s is responding to a "
          , D.i__ "different"
          , text_ "event with the following type:"
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
              "While each of these events will have the same content, computing them from their constituent events wastes CPU and can be a drain on your app. To solve this, we use "
          , D.b__ "memoization"
          , text_ "."
          ]
      ]
  , subsections:
      [ transformedEvents, initialEvents ]
  }
