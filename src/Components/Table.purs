module Components.Table where

import Deku.Attribute (Attribute)
import Deku.DOM.Attributes as DA
import FRP.Poll (Poll)

tableClass
  :: forall r
   . Poll
       ( Attribute
           ( klass :: String
           | r
           )
       )
tableClass = DA.klass_
  "pl-2 pr-2 border border-slate-500 dark:border-white-300"
