module Components.Code where

import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Prism (forceHighlight)

jsCode :: forall lock payload. String -> Domable lock payload
jsCode code = D.pre (D.Class !:= "prism-code language-javascript")
  [ D.code_
      [ text_ code
      ]
  , forceHighlight
  ]

psCode :: forall lock payload. String -> Domable lock payload
psCode code = D.pre (D.Class !:= "prism-code language-purescript")
  [ D.code_
      [ text_ code
      ]
  , forceHighlight
  ]

bashCode :: forall lock payload. String -> Domable lock payload
bashCode code = D.pre (D.Class !:= "prism-code language-bash")
  [ D.code_
      [ text_ code
      ]
  , forceHighlight
  ]