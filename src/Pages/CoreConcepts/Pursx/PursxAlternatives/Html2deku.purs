module Pages.CoreConcepts.Pursx.PursxAlternatives.Html2deku where

import Prelude

import Components.HTML2Deku.Component as HTML2Deku
import Contracts (Subsection, subsection)

import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D

html2deku :: Subsection
html2deku = subsection
  { title: "html2deku"
  , matter: pure
      [ D.p_
          [ D.a
              [ DA.href_ "https://mikesol.github.io/html2deku"
              , DA.target_ "_blank"
              ]
              [ D.code__ "html2deku" ]
          , text_
              " is a small web app that converts HTML to Deku. A miniature version of it is embedded below."
          ]
      , HTML2Deku.html2deku
      , D.p__
          "Depending on who's responding to server requests on any given day, the website is anywhere from 90% to 98% accurate in its conversion. If you anticipate writing a logic-heavy app that will use lots of PureScript primitives, it's a good idea to convert its HTML to Deku syntax early on."
      ]
  }
