module Main where

import Prelude

import Components.App (app)
import Data.Foldable (traverse_)
import Deku.Core (envy)
import Deku.Do as Deku
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Dedup (dedup)
import FRP.Event (create, mailboxed)
import Router.ADT (Route(..))
import Router.Page (routeToPage)
import Router.Route (route)
import Routing.Duplex (parse)
import Routing.PushState (makeInterface, matchesWith)

introductionChapterTitle :: String
introductionChapterTitle = "Introduction"

coreConceptsChapterTitle :: String
coreConceptsChapterTitle = "Core concepts"

frpChapterTitle :: String
frpChapterTitle = "Functional reactive programming"

advancedUsageChapterTitle :: String
advancedUsageChapterTitle = "Advanced usage"

main :: Effect Unit
main = do
  currentRouteMailbox <- create
  previousRouteMailbox <- create
  currentRoute <- create
  psi <- makeInterface
  runInBody
    ( Deku.do
        pageWas <- envy <<< mailboxed
          ({ address: _, payload: unit } <$> previousRouteMailbox.event)
        pageIs <- envy <<< mailboxed
          ({ address: _, payload: unit } <$> currentRouteMailbox.event)
        app
          { pageIs
          , pageWas
          , pushState: psi.pushState
          , curPage: routeToPage <$> currentRoute.event
          , showHeader: dedup (eq GettingStarted <$> currentRoute.event)
          }
    )
  void $ matchesWith (parse route)
    ( \old new -> traverse_ previousRouteMailbox.push old
        *> currentRouteMailbox.push new
        *> currentRoute.push new
    )
    psi
