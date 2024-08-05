module FRP.Lag where

import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\), type (/\))
import FRP.Event (class IsEvent, mapAccum)

lag :: forall e a. IsEvent e => e a -> e (Maybe a /\ a)
lag = mapAccum abtac Nothing
  where
  abtac a b = Just b /\ (a /\ b)
