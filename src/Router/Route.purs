module Router.Route where

import Prelude hiding ((/))

import Router.ADT (Route)
import Routing.Duplex (RouteDuplex', root)
import Routing.Duplex.Generic (noArgs, sum)
import Routing.Duplex.Generic.Syntax ((/))

route :: RouteDuplex' Route
route = root $ sum
  { "GettingStarted": noArgs
  , "HelloWorld": "introduction" / "hello-world" / noArgs
  , "Components": "core-concepts" / "components" / noArgs
  , "State": "core-concepts" / "state" / noArgs
  , "Pursx": "core-concepts" / "pursx" / noArgs
  , "Collections": "core-concepts" / "collections" / noArgs
  , "Portals": "core-concepts" / "portals" / noArgs
  , "Providers": "core-concepts" / "providers" / noArgs
  , "Effects": "core-concepts" / "effects" / noArgs
  , "MoreHooks": "core-concepts" / "more-hooks" / noArgs
  , "Events": "functional-reactive-programming" / "events" / noArgs
  , "Applicatives": "functional-reactive-programming" / "applicatives" / noArgs
  , "Alternatives": "functional-reactive-programming" / "alternatives" / noArgs
  , "Filtering": "functional-reactive-programming" / "filtering" / noArgs
  , "Sampling": "functional-reactive-programming" / "sampling" / noArgs
  , "OtherInstances": "functional-reactive-programming" / "other-instances" /
      noArgs
  , "Busses": "functional-reactive-programming" / "busses" / noArgs
  , "FixAndFold": "functional-reactive-programming" / "fix-and-fold" / noArgs
  , "Behaviors": "functional-reactive-programming" / "behaviors" / noArgs
  , "CustomElements": "advanced-usage" / "custom-elements" / noArgs
  , "AccessingTheDOM": "advanced-usage" / "accessing-the-dom" / noArgs
  , "SSR": "advanced-usage" / "ssr" / noArgs
  }