module Pages.CoreConcepts.Components.ASimpleComponent.AddingText where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

addingText :: Subsection
addingText = subsection
  { title: "Adding text"
  , matter: pure
      [ D.p_
          [ text_ "Text in deku is created via the "
          , D.code_ [ text_ "text_" ]
          , text_ " function. Additionally, for elements that "
          , D.i_ [ text_ "only" ]
          , text_
              " contain text, you can use a double-underscore. For example, "
          , D.code_ [ text_ "D.i__ \"Pow!\"" ]
          , D.i_ [ text_ "Pow!" ]
          ]
      ]
  }
