module Pages.FRP.Events.InteractiveEvents.LifetimeAndGarbageCollection
  ( lifetimeAndGarbageCollection
  )
  where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Attributes (href)
import Deku.Control (text, text_)
import Deku.DOM as D

lifetimeAndGarbageCollection :: Subsection
lifetimeAndGarbageCollection = subsection
  { title: "Lifetime and garbage collection"
  , matter: pure
      [ D.p_
          [ text_ "Interactive events' pushers are created in an "
          , D.code__ "Effect"
          , text_ " context and have the same longevity as a "
          , D.a
              [ href
                  "https://pursuit.purescript.org/packages/purescript-refs/6.0.0/docs/Effect.Ref#t:Ref"
                  , D.Target !:= "_blank"
              ]
              [ text_ "Ref" ]
          , text
              ". That is, their lifetime is completely managed by JavaScript garbage collection instead of PureScript. In most cases, modern JavaScript engines are smart enough to clean these when they are no longer needed, but as a precaution, you should have an eye on where you dispatch both pushers and events to make sure too many of them are not accidentally stashed in long-living objects."
          ]
      ]
  }
