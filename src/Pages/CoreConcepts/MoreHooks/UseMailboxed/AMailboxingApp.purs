module Pages.CoreConcepts.MoreHooks.UseMailboxed.AMailboxingApp where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

aMailboxingApp :: forall lock payload. Subsection lock payload
aMailboxingApp = subsection
  { title: "A mailboxing app"
  , matter:
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "A mailboxing app" ]
          , text_ "."
          ]
      ]
  }
