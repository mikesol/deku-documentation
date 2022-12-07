module Router.RouteOrder where

import Prelude

import Data.Array (drop, zip)
import Data.Map (Map, fromFoldable, lookup)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Pages.Docs (docs)
import Router.ADT (Route(..))

pageOrder :: Array Route
pageOrder = join $ map (unwrap >>> _.pages >>> map (unwrap >>> _.route))
  (unwrap docs)

pageOrderMinusOne = drop 1 pageOrder

routeToNextRouteMap :: Map Route Route
routeToNextRouteMap = fromFoldable (zip pageOrder pageOrderMinusOne)

routeToPrevRouteMap :: Map Route Route
routeToPrevRouteMap = fromFoldable (zip pageOrderMinusOne pageOrder)

routeToNextRoute :: Route -> Maybe Route
routeToNextRoute FourOhFour = Nothing
routeToNextRoute a = lookup a routeToNextRouteMap

routeToPrevRoute :: Route -> Maybe Route
routeToPrevRoute FourOhFour = Nothing
routeToPrevRoute a = lookup a routeToPrevRouteMap