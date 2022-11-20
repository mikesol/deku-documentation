module Pages.CoreConcepts.MoreHooks.UseMailboxed.MailboxesAsFilters where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

mailboxesAsFilters :: forall lock payload. Subsection lock payload
mailboxesAsFilters = subsection
    { title: "Mailboxes as filters"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Mailboxes as filters"]
            , text_ "."
            ]
        ]
    }
