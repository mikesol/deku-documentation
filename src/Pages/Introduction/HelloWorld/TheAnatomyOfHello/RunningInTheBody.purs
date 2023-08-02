module Pages.Introduction.HelloWorld.TheAnatomyOfHello.RunningInTheBody where

import Router.ADT (Route(..))
import Components.Code (psCode)
import Contracts (Subsection, Env(..), subsection)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D

runningInTheBody :: Subsection
runningInTheBody = subsection
  { title: "Running in the body"
  , matter: \(Env { routeLink }) ->
      [ psCode
          """runInBody (...)"""
      , D.p_
          [ text
              "The most common way to run a Deku app is to embed it in the "
          , D.a
              [D.Href :=
                  "https://developer.mozilla.org/en-US/docs/Web/HTML/Element/body"
              ]
              [ text "body" ]
          , text
              " of a webpage. This is not the only way, however. You can also embed a Deku app in an arbitrary element, or you could avoid embedding it entirely and instead render it as a "
          , D.code_ [ text "String" ]
          , text
              " of HTML, for example when doing Static Site Rendering ("
          , routeLink SSR
          , text
              "). We'll go over these techniques later in the documentation, but for now, we'll stick to presenting our app in a webpage's body."
          ]
      ]
  }
