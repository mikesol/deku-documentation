module Pages.FRP.Filtering.Filter.FilteringAnEvent where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

filteringAnEvent :: Subsection
filteringAnEvent = subsection
  { title: "Filtering an event"
  , matter: do
      example <-  getExample StartCollapsed Nothing Examples.FilteringAnEvent
      pure [ D.p_
          [ text "You can filter an event using "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:filter"
              [ D.code__ "filter" ]
          , text " from the "
          , D.code__ "Filterable"
          , text " typeclass."
          ]
      , example
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
