module Router.Chapter where

import Contracts (Chapter)
import Pages.AdvancedUsage (advancedUsage)
import Pages.CoreConcepts (coreConcepts)
import Pages.FRP (frp)
import Pages.Introduction (introduction)
import Router.ADT (Route(..))

routeToChapter :: forall lock payload. Route -> Chapter lock payload
routeToChapter GettingStarted = introduction
routeToChapter HelloWorld = introduction
routeToChapter Components = coreConcepts
routeToChapter State = coreConcepts
routeToChapter Pursx = coreConcepts
routeToChapter Collections = coreConcepts
routeToChapter Portals = coreConcepts
routeToChapter Providers = coreConcepts
routeToChapter Effects = coreConcepts
routeToChapter MoreHooks = coreConcepts
routeToChapter Events = frp
routeToChapter Applicatives = frp
routeToChapter Alternatives = frp
routeToChapter Filtering = frp
routeToChapter Sampling = frp
routeToChapter OtherInstances = frp
routeToChapter Busses = frp
routeToChapter FixAndFold = frp
routeToChapter Behaviors = frp
routeToChapter CustomElements = advancedUsage
routeToChapter AccessingTheDOM = advancedUsage
routeToChapter SSR = advancedUsage