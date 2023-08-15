module Components.Table where

import Deku.Attribute (class Attr, Attribute, (:=))
import Deku.DOM as D

tableClass
  :: forall element. Attr element D.Class String => Attribute element
tableClass = D.Class := "pl-2 pr-2 border border-slate-500 dark:border-white-300"
