module Pages.CoreConcepts.MoreHooks.UseMailboxed.MailboxesAsFilters where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

mailboxesAsFilters :: Subsection
mailboxesAsFilters = subsection
  { title: "Hello mailbox"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.UseMailboxed
      pure
        [ D.p_
            [ text_ "A mailbox hook is similar to the "
            , D.code__ "useState"
            , text_
                " hook."
            ]
        , psCode """pusher /\ eventCreator <- useMailboxed"""
        , D.p_
            [ text_
                "However, the left and right side of the returned value are different."
            ]
        , D.ol_
            [ D.li_
                [ text_
                    "On the left, we have a pusher that takes a record of type "
                , D.code__ "{ address :: a, payload :: b }"
                , text_ "."
                ]
            , D.li_
                [ text_
                    "On the right, we have an event creator that takes a value of type "
                , D.code__ "a"
                , text_ " and produces an event of type "
                , D.code__ "Event b"
                , text_ "."
                ]
            ]
        , D.p_
            [ text_
                "When the pusher is pushed to, the mailbox delivers payloads of type "
            , D.code__ "b"
            , text_ " "
            , D.i__ "only to"
            , text_
                " events that have been created with by invoking the event creator with the same term of type "
            , D.code__ "a"
            , text_ " that was received by the pusher as an "
            , D.code__ "address"
            , text_ ". You can see an example below."
            ]
        , example
        ]
  }
