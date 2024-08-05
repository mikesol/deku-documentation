module Vike where

import Prelude

import Contracts (Chapter(..), Page(..))
import Data.Newtype (un)
import Router.ADT (Route(..))
import Router.Chapter (routeToChapter)
import Router.Page (routeToPage)

type VikePage = { page :: Route, route :: String }

makeVikePage :: Route -> VikePage
makeVikePage route =
  { page: route
  , route: case route of
      GettingStarted -> "/"
      _ -> (un Chapter $ routeToChapter route).path <>
        (un Page $ routeToPage route).path
  }