module Pages.CoreConcepts.MoreHooks.UseMailboxed.AMailboxingApp where

import Prelude

import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D
import Router.ADT (Route(..))

aMailboxingApp :: Subsection
aMailboxingApp = subsection
  { title: "Mailboxes are filters with superpowers"
  , matter: do
      Env { routeLink } <- getEnv
      pure
        [ D.p_
            [ text_ "While it's possible to achieve a similar outcome with "
            , routeLink Filtering
            , text_
                ", it's much slower. Individual filters for a collection of "
            , D.i__ "n"
            , text_ " items execute in "
            , D.i__ "O(n)"
            , text_
                " time because each entry has to check if it has a valid input."
            ]
        , D.p_
            [ text_
                "With mailbox, the postwoman is pre-sorting the mail and only delivering it to valid destinations. The sorting function executes in "
            , D.i__ "O(log n)"
            , text_ " time thanks to the "
            , D.code__ "Ord"
            , text_
                " constraint on the input. So when working with collections where you’ll have to update a single addressable element in response to an event, use mailboxes!"
            ]
        ]
  }
