module Pages.Introduction.HelloWorld.TheAnatomyOfHello.RunningInTheBody where

import Prelude

import Components.Code (psCode)
import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import Router.ADT (Route(..))

runningInTheBody :: Subsection
runningInTheBody = subsection
  { title: "Running in the body"
  , matter: do
      Env { routeLink } <- getEnv
      pure
        [ psCode
            """runInBody (...)"""
        , D.p_
            [ text_
                "The most common way to run a Deku app is to embed it in the "
            , D.a
                [ D.Href !:=
                    "https://developer.mozilla.org/en-US/docs/Web/HTML/Element/body"
                ]
                [ text_ "body" ]
            , text_
                " of a webpage. This is not the only way, however. You can also embed a Deku app in an arbitrary element, or you could avoid embedding it entirely and instead render it as a "
            , D.code_ [ text_ "String" ]
            , text_
                " of HTML, for example when doing Static Site Rendering ("
            , routeLink SSR
            , text_
                "). We'll go over these techniques later in the documentation, but for now, we'll stick to presenting our app in a webpage's body."
            ]
        ]
  }
