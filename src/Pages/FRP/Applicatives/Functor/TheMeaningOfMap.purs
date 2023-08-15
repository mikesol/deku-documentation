module Pages.FRP.Applicatives.Functor.TheMeaningOfMap where

import Prelude

import Components.Code (psCode)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Subsection, getEnv, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D
import Router.ADT (Route(..))

theMeaningOfMap :: Subsection
theMeaningOfMap = subsection
  { title: "The meaning of map"
  , matter: do
      Env { routeLink } <- getEnv
      pure [ D.p_
          [ text_ "Using the simplified type of "
          , D.code__ "Event"
          , text_ " from the "
          , routeLink Events
          , text_ " section, we can define "
          , D.code__ "Event"
          , text_ "'s "
          , D.code__ "Functor"
          , text_ " instance like so."
          ]
      , psCode
          """newtype Event a =
  Event (a -> Effect Unit) -> Effect (Effect Unit)

instance Functor Event where
  map f (Event e) = Event ((lcmap <<< lcmap) f e)
"""
      , D.p_
          [ text_ "The function "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-profunctor/docs/Data.Profunctor#v:lcmap"
              [ D.code__ "lcmap" ]
          , text_ " is like "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/6.0.1/Data.Functor#v:map"
              [ D.code__ "map" ]
          , text_ " but it maps over the "
          , D.i__ "left"
          , text
              " side of a profunctor (in our case, a function) instead of the right side."
          ]
      , D.p_
          [ text_ "To fulfill the functor laws, "
          , D.code__ "map"
          , text_ " applies the function to each value emitted by the event."
          ]
      ]
  }
