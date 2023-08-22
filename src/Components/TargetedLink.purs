module Components.TargetedLink where


import Deku.DOM.Attributes as DA
import Deku.Core (Nut)
import Deku.DOM as D

targetedLink
  :: String
  -> Array Nut
  -> Nut
targetedLink s = D.a
  [ DA.href_ s
  , DA.target_ "_blank"
  ]