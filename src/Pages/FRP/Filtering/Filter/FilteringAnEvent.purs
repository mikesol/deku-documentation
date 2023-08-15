module Pages.FRP.Filtering.Filter.FilteringAnEvent where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

filteringAnEvent :: Subsection
filteringAnEvent = subsection
  { title: "Filtering an event"
  , matter: do
      example <-  getExample StartCollapsed Nothing Examples.FilteringAnEvent
      pure [ D.p_
          [ text_ "You can filter an event using "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Filterable#v:filter"
              [ D.code__ "filter" ]
          , text_ " from the "
          , D.code__ "Filterable"
          , text_ " typeclass."
          ]
      , example
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
