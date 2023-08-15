module Components.TargetedLink where

import Deku.Attribute ((!:=))
import Deku.Attributes (href_)
import Deku.Core (Nut)
import Deku.DOM as D

targetedLink
  :: String
  -> Array Nut
  -> Nut
targetedLink s = D.a
  [ href_ s
  , D.Target !:= "_blank"
  ]