module Pages.CoreConcepts.Effects.Aff.TriggerEffect where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Data.Int (floor)
import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (blank, text, text_, (<#~>))
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, useState')
import Deku.Listeners (click, click_)
import Deku.Pursx ((~~))
import Effect.Aff (Milliseconds(..), delay, launchAff, launchAff_)
import Effect.Class (liftEffect)
import Effect.Random (random)
import FRP.Event.Effect (bindToEffect)
import QualifiedDo.Alt as Alt
import Type.Proxy (Proxy(..))

triggerEffect :: forall lock payload. Subsection lock payload
triggerEffect = subsection
  { title: "The bindToEffect function"
  , matter: pure
      [ D.p_
          [ text_
              "The bind to effect function is the least vile of these sins. It allows us to hitch an arbitrary effect to an event stream."
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
                    Alt.do
                      click_ (setThunk unit)
                      klass_ "cursor-pointer"
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
                    Alt.do
                      click_ (getTime <$> now >>= setDate)
                      klass_ "cursor-pointer"
                    [ text_ "Current timestamp" ]
                , text_ ": "
                , text (show <$> date)
                ]
          ]
      , D.p_
          [ text_ "Sometimes, in a pinch, the above code is not possible because your eyes are on the problematic spot and you can't work backwards to the root cause. When using effects that way, try to use "
          , D.code__ "useMemoized"
          , text_ " to avoid unnecessarily re-running the effect!"
          ]
      ]
  }
