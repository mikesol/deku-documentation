module Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheToplevelElement where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

theToplevelElement :: Subsection
theToplevelElement = subsection
  { title: "Toplevel element"
  , matter: pure
      [ D.p_
          [ text "The "
          , D.code__ "runSSR"
          , text
              " function automatically places the generated Deku code in the body of an HTML document. To change the toplevel HTML element, call "
          , D.code__ "runSSR'"
          , text " with the desired toplevel tagname as the first argument."
          ]
      ]
  }
