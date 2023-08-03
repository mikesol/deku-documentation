module FRP.Dedup where

import Prelude

import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.NonEmpty (NonEmpty, (:|))
import Data.Tuple (Tuple(..))
import FRP.Event (Event, mapAccum)

dedup :: forall a. Eq a => Event a -> Event a
dedup = dedup' eq

dedup' :: forall a. (a -> a -> Boolean) -> Event a -> Event a
dedup' = dedup'' Nothing

dedupNE :: forall a. Eq a => NonEmpty Event a -> NonEmpty Event a
dedupNE = dedupNE' eq

dedupNE'
  :: forall a. (a -> a -> Boolean) -> NonEmpty Event a -> NonEmpty Event a
dedupNE' f (h :| t) = h :| dedup'' (Just h) f t

dedup'' :: forall a. Maybe a -> (a -> a -> Boolean) -> Event a -> Event a
dedup'' iv eqq e = compact $
  mapAccum
    ( \b a ->
        let
          ja = Just a
        in
          Tuple ja
            ( case b of
                Nothing -> Just a
                Just b'
                  | b' `eqq` a -> Nothing
                  | otherwise -> Just a
            )
    )
    iv
    e
