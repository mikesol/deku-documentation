module Main where

import Prelude

import Components.FrontPage (everything)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody everything