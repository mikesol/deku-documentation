module FRP.Lag where

import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\), type (/\))
import FRP.Event (Event, mapAccum)

lag :: forall a. Event a -> Event (Maybe a /\ a)
lag = mapAccum abtac Nothing
  where
  abtac a b = Just b /\ (a /\ b)