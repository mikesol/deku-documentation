module Pages.CoreConcepts.MoreHooks.UseMailboxed.MailboxesAsFilters where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

mailboxesAsFilters :: Subsection
mailboxesAsFilters = subsection
  { title: "Hello mailbox"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.UseMailboxed
      pure [ D.p_
          [ text "A mailbox hook is similar to the "
          , D.code__ "useState'"
          , text
              " hook."
          ]
      , psCode """pusher /\ eventCreator <- useMailboxed"""
      , D.p_
          [ text
              "However, the left and right side of the returned value are different."
          ]
      , D.ol_
          [ D.li_
              [ text
                  "On the left, we have a pusher that takes a record of type "
              , D.code__ "{ address :: a, payload :: b }"
              , text "."
              ]
          , D.li_
              [ text
                  "On the right, we have an event creator that takes a value of type "
              , D.code__ "a"
              , text " and produces an event of type "
              , D.code__ "Event b"
              , text "."
              ]
          ]
      , D.p_
          [ text
              "When the pusher is pushed to, the mailbox delivers payloads of type "
          , D.code__ "b"
          , text " "
          , D.i__ "only to"
          , text
              " events that have been created with by invoking the event creator with the same term of type "
          , D.code__ "a"
          , text " that was received by the pusher as an "
          , D.code__ "address"
          , text ". You can see an example below."
          ]
      , example
      ]
  }
