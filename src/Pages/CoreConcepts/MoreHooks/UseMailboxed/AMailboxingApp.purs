module Pages.CoreConcepts.MoreHooks.UseMailboxed.AMailboxingApp where

import Prelude

import Contracts (Env(..), Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

aMailboxingApp :: forall lock payload. Subsection lock payload
aMailboxingApp = subsection
  { title: "Mailboxes are filters with superpowers"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "While it's possible to achieve a similar outcome with "
          , routeLink Filtering
          , text_
              ", it is much slower. Individual filters execute in "
          , D.i__ "O(n)"
          , text_
              " because each entry has to check if it has a valid input."
          ]
      , D.p_
          [ text_
              "With mailbox, the postwoman is pre-sorting the mail and only delivring it to valid inputs. The sorting function is "
          , D.i__ "O(logn)"
          , text_ " thanks to the "
          , D.code__ "Ord"
          , text_
              " constraint on the input. So when woring with collections where you'll have to update a single addressable element in response to an event, use mailboxes!"
          ]
      ]
  }
