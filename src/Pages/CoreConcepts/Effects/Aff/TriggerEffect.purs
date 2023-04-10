module Pages.CoreConcepts.Effects.Aff.TriggerEffect where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click_)
import FRP.Event.Effect (bindToEffect)
import Router.ADT (Route(..))

triggerEffect :: Subsection
triggerEffect = subsection
  { title: "The bindToEffect function"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_
              "The bind to effect function is an exception - it is perfectly acceptable if not slightly awkward. It's almost never used in practice because a similar idea is encapsulated by "
          , routeLink Behaviors
          , text_
              ". It allows us to hitch an arbitrary effect to an event stream."
          ]
      , psCode
          """Deku.do
  setThunk /\ thunk <- useState'
  D.div_
    [ D.a
        Alt.do
          click_ (setThunk unit)
          klass_ "cursor-pointer"
        [ text_ "Current timestamp" ]
    , text_ ": "
    , text (show <$> bindToEffect thunk (const (getTime <$> now)))
    ]"""
      , exampleBlockquote
          [ Deku.do
              setThunk /\ thunk <- useState'
              D.div_
                [ D.a
                      [click_ (setThunk unit),
                      klass_ "cursor-pointer"]
                    [ text_ "Current timestamp" ]
                , text_ ": "
                , text (show <$> bindToEffect thunk (const (getTime <$> now)))
                ]
          ]
      , D.p__ "Ew. We could (and should!) have done:"
      , psCode
          """Deku.do
  setDate /\ date <- useState'
  D.div_
    [ D.a
        Alt.do
          click_ (getTime <$> now >>= setDate)
          klass_ "cursor-pointer"
        [ text_ "Current timestamp" ]
    , text_ ": "
    , text (show <$> date)
    ]"""
      , exampleBlockquote
          [ Deku.do
              setDate /\ date <- useState'
              D.div_
                [ D.a
                    [click_ (getTime <$> now >>= setDate),
                      klass_ "cursor-pointer"]
                    [ text_ "Current timestamp" ]
                , text_ ": "
                , text (show <$> date)
                ]
          ]
      , D.p_
          [ text_
              "Sometimes, in a pinch, the above code is not possible because your eyes are on the problematic spot and you can't work backwards to the root cause. When using effects that way, try to use "
          , D.code__ "useMemoized"
          , text_ " to avoid unnecessarily re-running the effect!"
          ]
      ]
  }
