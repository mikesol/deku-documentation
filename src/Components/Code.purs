module Components.Code where

import Prelude

import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Prism (forceHighlight)

jsCode :: forall lock payload. String -> Domable lock payload
jsCode code = D.pre (D.Class !:= "prism-code language-javascript")
  [ D.code_
      [ text_ code
      ]
  ]

htmlCode :: forall lock payload. String -> Domable lock payload
htmlCode code = D.pre (D.Class !:= "prism-code language-markup")
  [ D.code_
      [ text_ code
      ]
  ]

psCode :: forall lock payload. String -> Domable lock payload
psCode code = D.pre (D.Class !:= "prism-code language-purescript")
  [ D.code_
      [ text_ code
      ]
  ]

psCodeNoCollapse :: forall lock payload. String -> Domable lock payload
psCodeNoCollapse code = D.pre
  (D.Class !:= "prism-code no-collapse language-purescript")
  [ D.code (klass_ "no-collapse")
      [ text_ code
      ]
  ]

psCode2 :: forall lock payload. String -> Domable lock payload
psCode2 code = D.pre (D.Class !:= "prism-code language-purescript")
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
  ]