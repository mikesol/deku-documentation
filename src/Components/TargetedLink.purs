module Components.TargetedLink where

import Deku.Attribute ((:=))
import Deku.Attributes (href)
import Deku.Core (Nut)
import Deku.DOM as D

targetedLink
  :: String
  -> Array Nut
  -> Nut
targetedLink s = D.a
  [ href s
  , D.Target := "_blank"
  ]