module Pages.FRP.Alternatives.Alt.AltAsAMuxer where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass, klass_)
import Deku.Control (text_)
import Deku.DOM as D
import FRP.Event.Time (interval)

altAsAMuxer :: forall lock payload. Subsection lock payload
altAsAMuxer = subsection
  { title: "Alt as a muxer"
  , matter: pure
      [ D.p_
          [ text_ "In the example below, we'll use "
          , D.code__ "alt"
          , text_ ", aka "
          , D.code__ "<|>"
          , text_ ", and whose definition is "
          , D.code__ "Event a -> Event a -> Event a"
          , text_
              " to mux together two streams controlling the background of a div. The result will be a rave in your browser... sort of..."
          ]
      , psCode
          """module Main where

import Prelude

import Control.Alt ((<|>))
import Deku.Attributes (klass)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody do
  D.div
    ( klass
        ((interval 200 $> "bg-pink-300")
           <|> (interval 165 $> "bg-green-300"))
    )
    [ text_ "Par-tay!" ]"""
      , exampleBlockquote
          [ D.div
              ( klass
                  ( (interval 200 $> "bg-pink-300") <|>
                      (interval 165 $> "bg-green-300")
                  )
              )
              [ text_ "Par-tay!" ]
          ]
      , D.p__ "The alternating of the two streams creates the strobe effect."
      ]
  }
