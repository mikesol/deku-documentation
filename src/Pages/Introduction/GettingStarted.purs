module Pages.Introduction.GettingStarted where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Pages.Introduction.GettingStarted.GettingHelp (gettingHelp)
import Pages.Introduction.GettingStarted.QuickStart (quickStart)
import Pages.Introduction.GettingStarted.WhyDeku (whyDeku)
import Router.ADT (Route(..))

gettingStarted :: Page
gettingStarted = page
  { route: GettingStarted
  , topmatter: pure
      [ D.p [D.Class := "lead"]
          [ text "Hi 👋" ]
      , D.p_
          [ text
              "You've found the documentation for "
          , D.span [klass "font-bold"] [ text "PureScript Deku" ]
          , text
              ". If you got here by accident because you wanted to learn another UI framework, please consider staying, as Deku is really, really sweet."
          ]
      ]
  , sections:
      [ quickStart, {-basicUsage,-} whyDeku, gettingHelp ]
  }
