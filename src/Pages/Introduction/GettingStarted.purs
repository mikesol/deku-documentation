module Pages.Introduction.GettingStarted where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.GettingStarted.GettingHelp (gettingHelp)
import Pages.Introduction.GettingStarted.QuickStart (quickStart)
import Pages.Introduction.GettingStarted.WhyDeku (whyDeku)
import Router.ADT (Route(..))

gettingStarted :: forall lock payload. Page lock payload
gettingStarted = page
  { route: GettingStarted
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "Hi 👋" ]
      , D.p_
          [ text_
              "You've found the documentation for "
          , D.span (klass_ "font-bold") [ text_ "PureScript Deku" ]
          , text_
              ". If you got here by accident because you wanted to learn another UI framework, please consider staying, as Deku is really, really sweet."
          ]
      ]
  , sections:
      [ quickStart, {-basicUsage,-} whyDeku, gettingHelp ]
  }
