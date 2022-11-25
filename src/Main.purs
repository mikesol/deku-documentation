module Main where

import Prelude

import Components.Page (page, titlePage)
import Deku.Control (switcher)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (create)
import Pages.AdvancedUsage.CustomElements (customElements)
import Pages.AdvancedUsage.SSR (sSR)
import Pages.CoreConcepts.Collections (collections)
import Pages.CoreConcepts.Components (components)
import Pages.CoreConcepts.Effects (effects)
import Pages.Introduction.HelloWorld (helloWorld)
import Pages.CoreConcepts.MoreHooks (moreHooks)
import Pages.CoreConcepts.Portals (portals)
import Pages.CoreConcepts.Providers (providers)
import Pages.CoreConcepts.Pursx (pursx)
import Pages.CoreConcepts.State (state)
import Pages.FRP.Alternatives (alternatives)
import Pages.FRP.Applicatives (applicatives)
import Pages.FRP.Behaviors (behaviors)
import Pages.FRP.Busses (busses)
import Pages.FRP.Delegates (delegates)
import Pages.FRP.Events (events)
import Pages.FRP.Filtering (filtering)
import Pages.FRP.FixAndFold (fixAndFold)
import Pages.FRP.Sampling (sampling)
import Pages.Introduction.GettingStarted (gettingStarted)
import Router.ADT (Route(..))
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
  routing <- create
  runInBody
    ( flip switcher routing.event $ case _ of
        GettingStarted -> titlePage GettingStarted introductionChapterTitle gettingStarted
        HelloWorld -> page HelloWorld introductionChapterTitle helloWorld
        Components -> page Components coreConceptsChapterTitle components
        State -> page State coreConceptsChapterTitle state
        Pursx -> page Pursx coreConceptsChapterTitle pursx
        Collections -> page Collections coreConceptsChapterTitle collections
        Portals -> page Portals coreConceptsChapterTitle portals
        Providers -> page Providers coreConceptsChapterTitle providers
        Effects -> page Effects coreConceptsChapterTitle effects
        MoreHooks -> page MoreHooks coreConceptsChapterTitle moreHooks
        Events -> page Events coreConceptsChapterTitle events
        Applicatives -> page Applicatives frpChapterTitle applicatives
        Alternatives -> page  Alternatives frpChapterTitle alternatives
        Filtering -> page Filtering frpChapterTitle filtering
        Sampling -> page Sampling frpChapterTitle sampling
        Delegates -> page Delegates frpChapterTitle delegates
        Busses -> page Busses frpChapterTitle busses
        FixAndFold -> page FixAndFold frpChapterTitle fixAndFold
        Behaviors -> page Behaviors frpChapterTitle behaviors
        CustomElements -> page CustomElements advancedUsageChapterTitle customElements
        SSR -> page SSR advancedUsageChapterTitle sSR
    )
  psi <- makeInterface
  void $ matchesWith (parse route) (\_ new -> routing.push new) psi
