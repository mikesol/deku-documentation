module Pages.FRP.Filtering.Filter.FilteringAnEvent where

import Prelude

import Components.Disclaimer (disclaimer)
import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

filteringAnEvent :: Subsection
filteringAnEvent = subsection
  { title: "Filtering an event"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.FilteringAnEvent
      pure
        [ D.p_
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
        , disclaimer
            { header: D.span_ [ text_ "A slight of hand" ]
            , message: D.div_
                [ D.blockquote_
                    [ D.p_
                        [ text_
                            "Woah woah woah, you've been turning events into polls using functions like "
                        , D.code__ "sham"
                        , text_ " and "
                        , D.code__ "dredge"
                        , text_
                            " and we've put up with it, but now you’re not even pretending anymore. You're calling "
                        , D.code__ "filter"
                        , text_ " on an "
                        , D.code__ "Poll"
                        , text_
                            " in the example above and you’re passing it off as an event? What gives?"
                        ]
                    ]
                , D.p_
                    [ text_ "Ok, ok, guilty as charged. The thing is, "
                    , D.code__ "Poll"
                    , text_ "s "
                    , D.i__ "are"
                    , text_ " "
                    , D.code__ "Event"
                    , text_
                        "s in the sense that "
                    , D.code__ "Poll"
                    , text_ " implements all of the typeclasses that "
                    , D.code__ "Event"
                    , text_
                        " does. Ecclesiastical scholars of functional theology often call this "
                    , D.i__ "Eventpolular transubstantiation"
                    , text_ "."
                    ]
                , D.p_
                    [ text_
                        "The important thing to know is that events and polls can almost always be used interchangeably in polymorphic functions. So when you build intuition for how one works, it works that way for the other and vice versa. I write more about this "
                    , targetedLink
                        "https://dev.to/mikesol/a-poll-hot-events-or-applicatives-choose-two-4454"
                        [ text_ "here" ]
                    , text_ "."
                    ]
                ]

            }
        ]
  }
