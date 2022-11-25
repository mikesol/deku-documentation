module Pages.Introduction.HelloWorld.RunningOurProgram.BundlingForProduction where

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D

bundlingForProduction :: forall lock payload. Subsection lock payload
bundlingForProduction = subsection
    { title: "Bundling for production"
    , matter:
        [ D.p_
            [ text_ "This subsection will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "Bundling for production"]
            , text_ "."
            ]
        ]
    }
