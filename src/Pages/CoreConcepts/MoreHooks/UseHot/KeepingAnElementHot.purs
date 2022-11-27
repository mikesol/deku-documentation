module Pages.CoreConcepts.MoreHooks.UseHot.KeepingAnElementHot where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

keepingAnElementHot :: forall lock payload. Subsection lock payload
keepingAnElementHot = subsection
  { title: "Keeping an element hot"
  , matter: pure
      [ D.p_
          [ text_ "This subsection will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Keeping an element hot" ]
          , text_ "."
          ]
      ]
  }
