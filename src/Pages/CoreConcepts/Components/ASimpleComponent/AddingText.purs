module Pages.CoreConcepts.Components.ASimpleComponent.AddingText where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

addingText :: Subsection
addingText = subsection
  { title: "Adding text"
  , matter: pure
      [ D.p_
          [ text "Text in deku is created via the "
          , D.code_ [ text "text" ]
          , text " function. Additionally, for elements that "
          , D.i_ [ text "only" ]
          , text
              " contain text, you can use a double-underscore. For example, "
          , D.code_ [ text "D.i__ \"Pow!\"" ]
          , D.i_ [ text "Pow!" ]
          ]
      ]
  }
