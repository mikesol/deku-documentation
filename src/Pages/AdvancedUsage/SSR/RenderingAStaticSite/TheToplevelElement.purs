module Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheToplevelElement where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

theToplevelElement :: Subsection
theToplevelElement = subsection
  { title: "Toplevel element"
  , matter: pure
      [ D.p_
          [ text_ "The "
          , D.code__ "runSSR"
          , text_
              " function automatically places the generated Deku code in the body of an HTML document. To change the toplevel HTML element, call "
          , D.code__ "runSSR'"
          , text_ " with the desired toplevel tagname as the first argument."
          ]
      ]
  }
