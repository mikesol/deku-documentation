module Examples.UnsafePursx where

import Prelude

import Deku.Pursx ((~!~))
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody ("<h4>(un)safe!</h4>" ~!~ {})