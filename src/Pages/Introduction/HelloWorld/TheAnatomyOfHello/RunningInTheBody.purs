module Pages.Introduction.HelloWorld.TheAnatomyOfHello.RunningInTheBody where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D

runningInTheBody :: Subsection
runningInTheBody = subsection
  { title: "Running in the body"
  , matter: do
      pure
        [ psCode
            """runInBody (...)"""
        , D.p_
            [ text_
                "The most common way to run a Deku app is to embed it in the "
            , D.a
                [ DA.href_
                    "https://developer.mozilla.org/en-US/docs/Web/HTML/Element/body"
                ]
                [ text_ "body" ]
            , text_
                " of a webpage. You can also embed a Deku app in an arbitrary element. For now, we’ll stick to presenting our app in a webpage's body."
            ]
        ]
  }
