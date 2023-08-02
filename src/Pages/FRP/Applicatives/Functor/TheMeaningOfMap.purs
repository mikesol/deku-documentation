module Pages.FRP.Applicatives.Functor.TheMeaningOfMap where

import Components.Code (psCode)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D
import Router.ADT (Route(..))

theMeaningOfMap :: Subsection
theMeaningOfMap = subsection
  { title: "The meaning of map"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text "Using the simplified type of "
          , D.code__ "Event"
          , text " from the "
          , routeLink Events
          , text " section, we can define "
          , D.code__ "Event"
          , text "'s "
          , D.code__ "Functor"
          , text " instance like so."
          ]
      , psCode
          """newtype Event a =
  Event (a -> Effect Unit) -> Effect (Effect Unit)

instance Functor Event where
  map f (Event e) = Event ((lcmap <<< lcmap) f e)
"""
      , D.p_
          [ text "The function "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-profunctor/docs/Data.Profunctor#v:lcmap"
              [ D.code__ "lcmap" ]
          , text " is like "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/6.0.1/Data.Functor#v:map"
              [ D.code__ "map" ]
          , text " but it maps over the "
          , D.i__ "left"
          , text
              " side of a profunctor (in our case, a function) instead of the right side."
          ]
      , D.p_
          [ text "To fulfill the functor laws, "
          , D.code__ "map"
          , text " applies the function to each value emitted by the event."
          ]
      ]
  }
