module Pages.CoreConcepts.Pursx.ASimpleExample.PlainOldHTML where

import Prelude

import Components.Code (psCode, psCodeNoCollapseWithLink)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

plainOldHTML :: Subsection
plainOldHTML = subsection
  { title: "Plain old HTML"
  , matter: pure
      [ D.p_
          [ text_
              "Here is the Deku code that produces the breadcrumb example above."
          ]
      , psCodeNoCollapseWithLink Examples.PlainOldHtml
      , D.p__
          "Just so that you don't miss it, after the large block of HTML, here's the actual Deku bit."
      , psCode
          """main :: Effect Unit
main = runInBody (myHtml ~~ {})"""
      , D.p_
          [ text_ "All you have to do is take your HTML string, add "
          , D.code__ "~~ {}"
          , text_
              " after it, and you get your HTML in the DOM prest-o change-o. In addition to being low-code, this is the most performant Deku gets. It literally takes the code and sets it as the "
          , D.code__ "innerHTML"
          , text_ " of some containing element."
          ]
      ]
  }
