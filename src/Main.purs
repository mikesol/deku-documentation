module Main where

import Prelude

import Components.Page (page)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Pages.FRP.Sampling (sampling)

main :: Effect Unit
main = runInBody (page "foo" sampling)