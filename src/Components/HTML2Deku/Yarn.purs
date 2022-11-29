module Components.HTML2Deku.Yarn
  ( pluralize
  , singularize
  , camelize
  , underscore
  , humanize
  , capitalize
  , titleize
  , tableize
  , classify
  , foreignKey
  , ordinalize
  ) where

import Data.Function.Uncurried (Fn2, runFn2)

foreign import pluralize :: String -> String
foreign import singularize :: String -> String
foreign import camelizeImpl :: Fn2 String Boolean String
foreign import underscore :: String -> String
foreign import humanizeImpl :: Fn2 String Boolean String
foreign import capitalize :: String -> String
foreign import titleize :: String -> String
foreign import tableize :: String -> String
foreign import classify :: String -> String
foreign import foreignKey :: String -> String
foreign import ordinalize :: String -> String

camelize :: String -> Boolean -> String
camelize = runFn2 camelizeImpl

humanize :: String -> Boolean -> String
humanize = runFn2 humanizeImpl