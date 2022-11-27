module Pages.CoreConcepts.MoreHooks.UseMailboxed where

import Prelude


import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.UseMailboxed.MailboxesAsFilters (mailboxesAsFilters)
import Pages.CoreConcepts.MoreHooks.UseMailboxed.AMailboxingApp (aMailboxingApp)

useMailboxed :: forall lock payload. Section lock payload
useMailboxed = section
  { title: "Use mailboxed"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Use mailboxed" ]
          , text_ "."
          ]
      ]
  , subsections:
      [ mailboxesAsFilters, aMailboxingApp ]
  }
