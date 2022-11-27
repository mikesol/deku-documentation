module Pages.CoreConcepts.MoreHooks where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.UseHot (useHot)
import Pages.CoreConcepts.MoreHooks.UseMailboxed (useMailboxed)
import Pages.CoreConcepts.MoreHooks.UseMemoized (useMemoized)
import Router.ADT (Route(..))

moreHooks :: forall lock payload. Page lock payload
moreHooks = page
  { route: MoreHooks
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "More hooks" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ useMailboxed, useHot, useMemoized ]
  }
