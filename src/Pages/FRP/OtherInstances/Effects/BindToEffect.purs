module Pages.FRP.OtherInstances.Effects.BindToEffect where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

b2e :: Subsection
b2e = subsection
  { title: "Binding to effects"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.BindToEffect
      pure
        [ D.p_
            [ text_
                "The example below shows how add an innocent little effect every time an event runs using "
            , D.code__ "bindToEffect"
            , text_ "."
            ]
        , psCode
            """bindToEffect :: forall a b. Event a -> (a -> Effect b) -> Event b
"""
        , D.p_
            [ text_ "In general, this is a "
            , D.i__ "very bad idea"
            , text_
                "™ as it can lead to all sorts of unpredictable side effects. However, when building an effect system, it can be useful to add an arbitrary side effect to each event."
            ]
        , example
        , D.p_
            [ text_ "As you likely noticed, the effect in "
            , D.code__ "bindToEffect"
            , text_ "runs "
            , D.i__ "before"
            , text_
                " any updates to the DOM. This is because, in order to get the value that we want (the DOM changes) we have to crack open the "
            , D.code__ "Effect"
            , text_ " and peek inside."
            ]
        ]
  }
