module Pages.Introduction.GettingStarted where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.GettingStarted.BasicUsage (basicUsage)
import Pages.Introduction.GettingStarted.GettingHelp (gettingHelp)
import Pages.Introduction.GettingStarted.QuickStart (quickStart)
import Router.ADT (Route(..))

gettingStarted :: forall lock payload. Page lock payload
gettingStarted = page
  { route:  GettingStarted
  , topmatter:
          [ D.p (D.Class !:= "lead")
              [ text_ "This page will be about "
                , D.span (D.Class !:= "font-bold") [ text_ "GettingStarted"]
                , text_ "."
              ]
          , D.p_
              [ text_
                  "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
              ]
          ]
  , sections:
      [ quickStart,gettingHelp,basicUsage]
  }
