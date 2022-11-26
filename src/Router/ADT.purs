module Router.ADT where

import Prelude

import Data.Generic.Rep (class Generic)
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