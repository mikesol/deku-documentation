module Pages.FRP.Alternatives.Alt.TheOneOfFunction where

import Prelude

import Components.Disclaimer (disclaimer)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

theOneOfFunction :: Subsection
theOneOfFunction = subsection
  { title: "The oneOf function"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.TheOneOfFunction
      pure
        [ D.p_
            [ D.code__ "Alt"
            , text_
                "ing lots of events can get tedios. Too many tie fighters! To make life easier, there's the "
            , D.code__ "oneOf"
            , text_
                " function that will alt a bunch of events. Surveys consistently reveal that this is the technique most often used when coders create a text-only version of "
            , D.b__ "Harder, Better, Faster, Stronger"
            , text_ " in the browser."
            ]
        , example
        , disclaimer
            { header: D.span_ [ text_ "Dredging" ]
            , message: D.p_
                [ text_ "The function"
                , D.code__ "dredge"
                , text_ " is like the function"
                , D.code__ "sham"
                , text_ " except that, instead of taking an "
                , D.code__ "Event"
                , text_ " and returning a "
                , D.code__ "Poll"
                , text_ ", it takes an "
                , D.code__ "Event"
                , text_ " constructor of type "
                , D.code__ "Event a -> Event b"
                , text_ " and returns a "
                , D.code__ "Poll"
                , text_ " constructor of type"
                , D.code__ "Poll a -> Poll b"
                , text_ "."
                ]
            }
        ]
  }
