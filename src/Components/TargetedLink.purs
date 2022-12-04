module Components.TargetedLink where


import Control.Alt ((<|>))
import Deku.Attribute ((!:=))
import Deku.Attributes (href_)
import Deku.Core (Domable)
import Deku.DOM as D

targetedLink :: forall lock2 payload3. String -> Array (Domable lock2 payload3) -> Domable lock2 payload3
targetedLink s = D.a
  ( href_ s <|>
      (D.Target !:= "_blank")
  )