module Pages.FRP.Events.StandAloneEvents.TheMakeEventFunction where

import Prelude

import Components.Code (psCode)
import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

theMakeEventFunction :: Subsection
theMakeEventFunction = subsection
  { title: "The makeEvent function"
  , matter: do
      Env { routeLink } <- getEnv
      pure
        [ D.p_
            [ text_ "To make a stand-alone effect, use the "
            , D.code__ "makeEvent"
            , text_
                " function. This function has a pretty frightening signature, so it's not for the feint of heart."
            ]
        , psCode
            """makeEvent
  :: forall a
   . ((forall b. Event b -> (b -> EventfulProgram a) -> ST Global (ST Global Unit)) -> ST Global (ST Global Unit))
  -> Event a"""
        , D.p_
            [ text_
                "This is similar-ish to the definition of ", D.code__ "Event", text_" above, except that "
            , D.code__ "EventfulProgram"
            , text_ " is a subset of "
            , D.code__ "Effect"
            , text_ " that lets you do a few things, like operations in the "
            , D.code__ "ST"
            , text_ " monad, "
            , D.i__ "without"
            , text_ " triggering additional side effects. As we'll see in the "
            , routeLink Sampling
            , text_
                " section, this is done so that we can push all side effects to the boundaries of our program."
            ]
            ,D.p__ "In theory, you should never have to use this low-level function. If you do, then chances are you're reading the source code, at which point these docs are but a memory. We miss you, come back 🥲"
        ]
  }
