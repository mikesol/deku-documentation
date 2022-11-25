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
instance Show Route where
  show = genericShow