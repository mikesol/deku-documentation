module Pages.Introduction.HelloWorld.TheAnatomyOfHello.TheMainFunction where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

theMainFunction :: forall lock payload. Subsection lock payload
theMainFunction = subsection
  { title: "The main function"
  , matter: pure
      [ psCode
          """main :: Effect Unit
main = ..."""
      , D.p_
          [ text_
              "In most PureScript programs (and most programs), a function or context called "
          , D.code_ [ text_ "main" ]
          , text_
              " is where the main action happens. If you take a peek in the Deku starter app you created in the getting started section, you'll see that it's this function that's called in "
          , D.code_ [ text_ "index.js" ]
          , text_ ", which in turn is imported into "
          , D.code_ [ text_ "index.html" ]
          , text_ ", the main page."
          ]
      ]
  }
