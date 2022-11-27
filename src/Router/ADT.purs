module Router.ADT where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Data.Show.Generic (genericShow)

data Route
  = GettingStarted
  | HelloWorld
  | Components
  | State
  | Pursx
  | Collections
  | Portals
  | Providers
  | Effects
  | MoreHooks
  | Events
  | Applicatives
  | Alternatives
  | Filtering
  | Sampling
  | Delegates
  | Busses
  | FixAndFold
  | Behaviors
  | CustomElements
  | SSR

derive instance Generic Route _
derive instance Eq Route
derive instance Ord Route
instance Show Route where
  show = genericShow

routeToNextRoute :: Route -> (Maybe Route)
routeToNextRoute GettingStarted = Just HelloWorld
routeToNextRoute HelloWorld = Just Components
routeToNextRoute Components = Just State
routeToNextRoute State = Just Pursx
routeToNextRoute Pursx = Just Collections
routeToNextRoute Collections = Just Portals
routeToNextRoute Portals = Just Providers
routeToNextRoute Providers = Just Effects
routeToNextRoute Effects = Just MoreHooks
routeToNextRoute MoreHooks = Just Events
routeToNextRoute Events = Just Applicatives
routeToNextRoute Applicatives = Just Alternatives
routeToNextRoute Alternatives = Just Filtering
routeToNextRoute Filtering = Just Sampling
routeToNextRoute Sampling = Just Delegates
routeToNextRoute Delegates = Just Busses
routeToNextRoute Busses = Just FixAndFold
routeToNextRoute FixAndFold = Just Behaviors
routeToNextRoute Behaviors = Just CustomElements
routeToNextRoute CustomElements = Just SSR
routeToNextRoute SSR = Nothing

routeToPrevRoute :: Route -> (Maybe Route)
routeToPrevRoute GettingStarted = Nothing
routeToPrevRoute HelloWorld = Just GettingStarted
routeToPrevRoute Components = Just HelloWorld
routeToPrevRoute State = Just Components
routeToPrevRoute Pursx = Just State
routeToPrevRoute Collections = Just Pursx
routeToPrevRoute Portals = Just Collections
routeToPrevRoute Providers = Just Portals
routeToPrevRoute Effects = Just Providers
routeToPrevRoute MoreHooks = Just Effects
routeToPrevRoute Events = Just MoreHooks
routeToPrevRoute Applicatives = Just Events
routeToPrevRoute Alternatives = Just Applicatives
routeToPrevRoute Filtering = Just Alternatives
routeToPrevRoute Sampling = Just Filtering
routeToPrevRoute Delegates = Just Sampling
routeToPrevRoute Busses = Just Delegates
routeToPrevRoute FixAndFold = Just Busses
routeToPrevRoute Behaviors = Just FixAndFold
routeToPrevRoute CustomElements = Just Behaviors
routeToPrevRoute SSR = Just CustomElements

routeToTitle :: Route -> String
routeToTitle GettingStarted = "Getting started"
routeToTitle HelloWorld = "Hello world"
routeToTitle Components = "Components"
routeToTitle State = "State"
routeToTitle Pursx = "Pursx"
routeToTitle Collections = "Collections"
routeToTitle Portals = "Portals"
routeToTitle Providers = "Providers"
routeToTitle Effects = "Effects"
routeToTitle MoreHooks = "More hooks"
routeToTitle Events = "Events"
routeToTitle Applicatives = "Applicatives"
routeToTitle Alternatives = "Alternatives"
routeToTitle Filtering = "Filtering"
routeToTitle Sampling = "Sampling"
routeToTitle Delegates = "Delegates"
routeToTitle Busses = "Busses"
routeToTitle FixAndFold = "Fix and fold"
routeToTitle Behaviors = "Behaviors"
routeToTitle CustomElements = "Custom elements"
routeToTitle SSR = "SSR"