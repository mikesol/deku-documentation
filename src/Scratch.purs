module Scratch where

import Prelude

import Deku.Do as Deku
--import Deku.Pursx ((~!~))
import Deku.Toplevel (runInBody)
import Effect (Effect)


main :: Effect Unit
main = pure unit --runInBody ("<h4>(un)safe!</h4>" ~!~ {})