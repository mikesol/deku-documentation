module FRP.Dedup where

import Prelude

import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import FRP.Event (class IsEvent, mapAccum)

dedup :: forall a event. IsEvent event => Eq a => event a -> event a
dedup = dedup' eq

dedup'
  :: forall a event. IsEvent event => (a -> a -> Boolean) -> event a -> event a
dedup' = dedup'' Nothing

dedup''
  :: forall a event
   . IsEvent event
  => Maybe a
  -> (a -> a -> Boolean)
  -> event a
  -> event a
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
