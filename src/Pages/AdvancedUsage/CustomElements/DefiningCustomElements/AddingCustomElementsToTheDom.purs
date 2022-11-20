module Pages.AdvancedUsage.CustomElements.DefiningCustomElements.AddingCustomElementsToTheDOM where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

addingCustomElementsToTheDOM :: forall lock payload. Subsection lock payload
addingCustomElementsToTheDOM = subsection
    { title: "Adding custom elements to the DOM"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Adding custom elements to the DOM"]
            , text_ "."
            ]
        ]
    }
