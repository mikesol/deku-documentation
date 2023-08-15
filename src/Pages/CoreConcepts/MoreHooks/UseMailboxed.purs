module Pages.CoreConcepts.MoreHooks.UseMailboxed where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.UseMailboxed.MailboxesAsFilters (mailboxesAsFilters)
import Pages.CoreConcepts.MoreHooks.UseMailboxed.AMailboxingApp (aMailboxingApp)

useMailboxed :: Section
useMailboxed = section
  { title: "Use mailboxed"
  , topmatter: pure
      [ D.p_
          [ text
              "In web apps, there are many cases where we receive information from a REST or GraphQL API that applies to a specific component in a large collection of Deku components, for example a game lobby picker or a friends list. In these cases, it is inefficient for every component in the collection to listen to the update. Instead, we want only the relevant components to listen. For these cases, there's "
          , D.code__ "useMailboxed"
          , text_ "."
          ]
      ]
  , subsections:
      [ mailboxesAsFilters, aMailboxingApp ]
  }
