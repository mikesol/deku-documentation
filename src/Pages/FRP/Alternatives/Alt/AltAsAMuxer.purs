module Pages.FRP.Alternatives.Alt.AltAsAMuxer where

import Prelude

import Components.ProTip (proTip)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

altAsAMuxer :: Subsection
altAsAMuxer = subsection
  { title: "Alt as a muxer"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.AltAsAMuxer
      pure
        [ D.p_
            [ text "In the example below, we'll use "
            , D.code__ "alt"
            , text ", aka "
            , D.code__ "<|>"
            , text ", and whose definition is "
            , D.code__ "Event a -> Event a -> Event a"
            , text
                " to mux together two streams controlling the background of a div. The result will be a rave in your browser... sort of..."
            ]
        , example
        , D.p__ "The alternating of the two streams creates the strobe effect."
        , proTip
            { header: text "Order of alting"
            , message: D.div_
                [ text "The "
                , D.code__ "<|>"
                , text " operator "
                , D.i__ "always"
                , text
                    "muxes from right to left for simultaneous events. For example, "
                , D.code__ "pure 0 <|> pure 1"
                , text " will emit 0 and then 1."
                ]
            }
        ]
  }
