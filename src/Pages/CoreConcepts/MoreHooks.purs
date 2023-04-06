module Pages.CoreConcepts.MoreHooks where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.MoreHooks.CustomHooks (customHooks)
import Pages.CoreConcepts.MoreHooks.UseRef (useRef)
import Pages.CoreConcepts.MoreHooks.UseMailboxed (useMailboxed)
import Pages.CoreConcepts.MoreHooks.UseMemoized (useMemoized)
import Router.ADT (Route(..))

moreHooks :: Page
moreHooks = page
  { route: MoreHooks
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "Specialized hooks for faster rendering."
          ]
      , D.p_
          [ text_
              "You're not off the hook yet! Here are some more hooks that can make your apps snappier in certain situations. Read on!"
          ]
      ]
  , sections:
      [ useMemoized, useMailboxed, useRef, customHooks ]
  }
