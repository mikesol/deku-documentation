module Pages.FRP.Filtering.Filter.FilteringAnEvent where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Data.Filterable (filter)
import Data.Tuple.Nested ((/\))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (slider)
import Examples as Examples

filteringAnEvent :: Subsection
filteringAnEvent = subsection
  { title: "Filtering an event"
  , matter: pure
      [ D.p_
          [ text "You can filter an event using "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:filter"
              [ D.code__ "filter" ]
          , text " from the "
          , D.code__ "Filterable"
          , text " typeclass."
          ]
      , psCodeWithLink Examples.FilteringAnEvent
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState 50.0
              D.div_
                [ D.input [slider setNumber] []
                , D.div_
                    [ text "Latest less than 50: "
                    , text (filter (_ < 50.0) number <#> show)
                    ]
                , D.div_
                    [ text "Latest greater than 50: "
                    , text (filter (_ > 50.0) number <#> show)
                    ]
                ]
          ]
      , D.p_
          [ text "The other members of "
          , D.code__ "Filterable"
          , text ", namely "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:filterMap"
              [ D.code__ "filterMap" ]
          , text ", "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:partition"
              [ D.code__ "partition" ]
          , text ", "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:partitionMap"
              [ D.code__ "partitionMap" ]
          , text ", are available as well and do what you think they'd do!"
          ]
      ]
  }
