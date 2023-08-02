module Pages.CoreConcepts.MoreHooks.UseMailboxed.AMailboxingApp where

import Prelude

import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text)
import Deku.DOM as D
import Router.ADT (Route(..))

aMailboxingApp :: Subsection
aMailboxingApp = subsection
  { title: "Mailboxes are filters with superpowers"
  , matter: do
      Env { routeLink } <- getEnv
      pure
        [ D.p_
            [ text "While it's possible to achieve a similar outcome with "
            , routeLink Filtering
            , text
                ", it's much slower. Individual filters for a collection of "
            , D.i__ "n"
            , text " items execute in "
            , D.i__ "O(n)"
            , text
                " time because each entry has to check if it has a valid input."
            ]
        , D.p_
            [ text
                "With mailbox, the postwoman is pre-sorting the mail and only delivring it to valid destinations. The sorting function executes in "
            , D.i__ "O(logn)"
            , text " time thanks to the "
            , D.code__ "Ord"
            , text
                " constraint on the input. So when woring with collections where you'll have to update a single addressable element in response to an event, use mailboxes!"
            ]
        ]
  }
