module Pages.CoreConcepts.Effects.Aff.TriggerEffect where

import Prelude

import Components.Code (psCodeWithLink)
import Contracts (Subsection, subsection)
import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Examples as Examples
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useEffect, useState')
import Deku.Listeners (click_)

triggerEffect :: Subsection
triggerEffect = subsection
  { title: "The useEffect hook"
  , matter: \_ ->
      [ D.p_
          [ text_
              "The "
          , D.code__ "useEffect"
          , text_
              " hook allows us to trigger an arbitrary side effect whenever an event is emitted. In general, this is pretty safe. However, because side effects can have indefinitely-long asynchronous behavior and trigger infinitely-many sub(sub(sub))-effects, you should use this with parsimony and restraint!"
          ]
      , D.p_
          [ text_ "In the example below, we use the "
          , D.code__ "useEffect"
          , text_
              " hook to update a timestamp every time the button is clicked. The same pattern is accomplishable via "
          , D.code__ "useRef"
          , text_
              ". As is the case with many things in Deku, there is more than one way to skin a Gerudian Lizalfos."
          ]
      , psCodeWithLink Examples.UseEffectHook
      , Deku.do
          setCurrentTime /\ currentTime <- useState'
          setClicked /\ clicked <- useState'
          useEffect clicked \_ -> getTime <$> now >>= setCurrentTime
          D.div_
            [ D.a
                [ click_ (setClicked unit)
                , klass_ "cursor-pointer"
                ]
                [ text_ "Current timestamp" ]
            , text_ ": "
            , text (show <$> currentTime)
            ]

      ]
  }
