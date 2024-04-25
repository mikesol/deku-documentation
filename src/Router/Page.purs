module Router.Page where

import Prelude

import Contracts (Page)
import Pages.AdvancedUsage.AccessingTheDOM (accessingTheDOM)
import Pages.AdvancedUsage.CustomElements (customElements)
import Pages.CoreConcepts.Collections (collections)
import Pages.CoreConcepts.Components (components)
import Pages.CoreConcepts.Effects (effects)
import Pages.CoreConcepts.MoreHooks (moreHooks)
import Pages.CoreConcepts.Portals (portals)
import Pages.CoreConcepts.Providers (providers)
import Pages.CoreConcepts.Pursx (pursx)
import Pages.CoreConcepts.State (state)
import Pages.FRP.Alternatives (alternatives)
import Pages.FRP.Applicatives (applicatives)
import Pages.FRP.Polls (polls)
import Pages.FRP.Events (events)
import Pages.FRP.Filtering (filtering)
import Pages.FRP.FixAndFold (fixAndFold)
import Pages.FRP.OtherInstances (otherInstances)
import Pages.FRP.Sampling (sampling)
import Pages.FourOhFour (fourOhFour)
import Pages.Introduction.GettingStarted (gettingStarted)
import Pages.Introduction.HelloWorld (helloWorld)
import Router.ADT (Route(..))

routeToPage :: Route -> Page
routeToPage GettingStarted = gettingStarted
routeToPage HelloWorld = helloWorld
routeToPage Components = components
routeToPage State = state
routeToPage Pursx = pursx
routeToPage Collections = collections
routeToPage Portals = portals
routeToPage Providers = providers
routeToPage Effects = effects
routeToPage MoreHooks = moreHooks
routeToPage Events = events
routeToPage Applicatives = applicatives
routeToPage Alternatives = alternatives
routeToPage Filtering = filtering
routeToPage Sampling = sampling
routeToPage OtherInstances = otherInstances
routeToPage FixAndFold = fixAndFold
routeToPage Polls = polls
routeToPage CustomElements = customElements
routeToPage AccessingTheDOM = accessingTheDOM
routeToPage FourOhFour = fourOhFour
