module Pages.CoreConcepts.Effects.Aff.TriggerEffect where

import Prelude

import Components.Code (psCodeWithLink)
import Contracts (Subsection, subsection)
import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Examples as Examples
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useEffect, useState')
import Deku.Listeners (click)

triggerEffect :: Subsection
triggerEffect = subsection
  { title: "The useEffect hook"
  , matter: \_ ->
      [ D.p_
          [ text
              "The "
          , D.code__ "useEffect"
          , text
              " hook allows us to trigger an arbitrary side effect whenever an event is emitted. In general, this is pretty safe. However, because side effects can have indefinitely-long asynchronous behavior and trigger infinitely-many sub(sub(sub))-effects, you should use this with parsimony and restraint!"
          ]
      , D.p_
          [ text "In the example below, we use the "
          , D.code__ "useEffect"
          , text
              " hook to update a timestamp every time the text "
          , D.b__ "Current timestamp"
          , text " is clicked. The same pattern is accomplishable via "
          , D.code__ "useRef"
          , text
              ". As is the case with many things in Deku, there is more than one way to skin a Gerudian Lizalfos."
          ]
      , psCodeWithLink Examples.RunningEffectsInResponseToEvents
      , Deku.do
          setCurrentTime /\ currentTime <- useState'
          setClicked /\ clicked <- useState'
          useEffect clicked \_ -> getTime <$> now >>= setCurrentTime
          D.div_
            [ D.a
                [ click (setClicked unit)
                , klass "cursor-pointer"
                ]
                [ text "Current timestamp" ]
            , text ": "
            , text (show <$> currentTime)
            ]

      ]
  }
