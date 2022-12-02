module Pages.CoreConcepts.MoreHooks.UseMailboxed.AMailboxingApp where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

aMailboxingApp :: forall lock payload. Subsection lock payload
aMailboxingApp = subsection
  { title: "A mailboxing app"
  , matter: pure
      [ D.p_
          [ text_ "To show off the power of mailboxes, let's build a little mailboxing app! We'll have three avatars you can send a message to. Make their day!"
          ]
      ]
  }
