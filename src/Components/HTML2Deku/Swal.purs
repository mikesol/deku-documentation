module Components.HTML2Deku.Swal where

import Prelude

import Effect (Effect)

foreign import swal :: { title :: String, text :: String  } -> Effect Unit