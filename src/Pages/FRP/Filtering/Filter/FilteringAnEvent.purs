module Pages.FRP.Filtering.Filter.FilteringAnEvent where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Data.Filterable (filter)
import Data.String.Utils (startsWith)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_, textInput, textInput_)

filteringAnEvent :: forall lock payload. Subsection lock payload
filteringAnEvent = subsection
  { title: "Filtering an event"
  , matter: pure
      [ D.p_
          [ text_ "You can filter an event using "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:filter"
              [ D.code__ "filter" ]
          , text_ " from the "
          , D.code__ "Filterable"
          , text_ " typeclass."
          ]
      , psCode
          """module Main where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Data.Filterable (filter)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider_)

main :: Effect Unit
main = runInBody Deku.do
  setNumber /\ number <- useState 50.0
  D.div_
    [ D.input (slider_ setNumber) []
    , D.div_
        [ text_ "Latest less than 50: "
        , text (filter (_ < 50.0) number <#> show)
        ]
    , D.div_
        [ text_ "Latest greater than 50: "
        , text (filter (_ > 50.0) number <#> show)
        ]
    ]"""
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState 50.0
              D.div_
                [ D.input (slider_ setNumber) []
                , D.div_
                    [ text_ "Latest less than 50: "
                    , text (filter (_ < 50.0) number <#> show)
                    ]
                , D.div_
                    [ text_ "Latest greater than 50: "
                    , text (filter (_ > 50.0) number <#> show)
                    ]
                ]
          ]
      , D.p_
          [ text_ "The other members of "
          , D.code__ "Filterable"
          , text_ ", namely "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:filterMap"
              [ D.code__ "filterMap" ]
          , text_ ", "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:partition"
              [ D.code__ "partition" ]
          , text_ ", "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:partitionMap"
              [ D.code__ "partitionMap" ]
          , text_ ", are available as well and do what you think they'd do!"
          ]
      ]
  }
