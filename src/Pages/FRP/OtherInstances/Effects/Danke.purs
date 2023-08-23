module Pages.FRP.OtherInstances.Effects.Danke where

import Prelude
import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples


danke :: Subsection
danke = subsection
  { title: "Thank the driver"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.ThankTheDriver
      pure
        [ D.p_
            [ text_
                "Continuing down bad-idea lane, the next function is used to run an arbitrary effect "
                , D.i__ "after"
                , text_ " an event emits. The only way to do this is not to depend on the value of the event - you pass it along and then run the effect. It is called "
            , D.code__ "thankTheDriver"
            , text_ " because we're tipping our hat to the driver (the subscription) after we jump off the bus (the event). Let the battle royale begin!"
            ]
        , psCode
            """thankTheDriver :: forall a. Event (Tuple (Effect Unit) a) -> Event a
"""
        , D.p_
            [ text_ "In general, this too is a "
            , D.i__ "very bad idea"
            , text_
                "™ as it can lead to all sorts of unpredictable side effects."
            ]
        , example
        ]
  }
