module DarkModePreference where

import Prelude

import Effect (Effect)

data DarkModePreference = LightMode | DarkMode | SystemDarkModePreference

foreign import prefersDarkMode :: Effect Boolean

newtype OnDark = OnDark (Effect Unit)
newtype OnLight = OnLight (Effect Unit)

foreign import darkModeListener :: OnDark -> OnLight -> Effect (Effect Unit)