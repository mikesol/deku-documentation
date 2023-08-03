module Pages.Introduction.HelloWorld.TheAnatomyOfHello.TheMainFunction where

import Prelude

import Components.Code (psCode)
import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text)
import Deku.DOM as D
import Router.ADT (Route(..))

theMainFunction :: Subsection
theMainFunction = subsection
  { title: "The main function"
  , matter: do
      Env { routeLink } <- getEnv
      pure
        [ psCode
            """main :: Effect Unit
main = ..."""
        , D.p_
            [ text
                "In most PureScript programs (and most programs), a function or context called "
            , D.code_ [ text "main" ]
            , text
                " is where the main action happens. If you take a peek in the Deku starter app you created in the "
            , routeLink GettingStarted
            , text " section, you'll see that "
            , D.code__ "main"
            , text " is called from "
            , D.code_ [ text "index.js" ]
            , text ", which in turn is imported into "
            , D.code_ [ text "index.html" ]
            , text "."
            ]
        ]
  }
