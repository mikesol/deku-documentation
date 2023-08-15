module Pages.CoreConcepts.Pursx.PursxAlternatives.Html2deku where

import Prelude

import Components.HTML2Deku.Component as HTML2Deku
import Contracts (Subsection, subsection)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Attributes (href)
import Deku.Control (text, text_)
import Deku.DOM as D

html2deku :: Subsection
html2deku = subsection
  { title: "html2deku"
  , matter: pure
      [ D.p_
          [ D.a
              [ href "https://mikesol.github.io/html2deku"
              , D.Target :=
                  "_blank"
              ]
              [ D.code__ "html2deku" ]
          , text
              " is a small web app that converts HTML to Deku. A miniature version of it is embedded below."
          ]
      , HTML2Deku.html2deku
      , D.p__
          "Depending on who's responding to server requests on any given day, the website is anywhere from 90% to 98% accurate in its conversion. If you anticipate writing a logic-heavy app that will use lots of PureScript primitives, it's a good idea to convert its HTML to Deku syntax early on."
      ]
  }
