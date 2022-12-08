module Components.Code where

import Prelude

import Control.Plus (empty)
import Deku.Attribute (Attribute, (!:=))
import Deku.Attributes (href_, klass_)
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Examples (ExampleADT, exampleToSlug, exampleToString)
import FRP.Event (Event)
import QualifiedDo.Alt as Alt

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

bashCode :: forall lock payload. String -> Domable lock payload
bashCode code = D.pre (D.Class !:= "prism-code language-bash")
  [ D.code_
      [ text_ code
      ]
  ]

-- 
psCode'
  :: forall lock17 payload18
   . String
  -> Event (Attribute D.Code_)
  -> String
  -> Domable lock17 payload18
psCode' s e code = D.pre
  (D.Class !:= ("prism-code language-purescript" <> s))
  [ D.code e
      [ text_ code
      ]
  ]

psCode :: forall lock payload. String -> Domable lock payload
psCode = psCode' "" empty

psCodeNoCollapse :: forall lock payload. String -> Domable lock payload
psCodeNoCollapse = psCode' " no-collapse" (klass_ "no-collapse")

--
psCodeWithLink'
  :: forall lock17 payload18
   . String
  -> Event (Attribute D.Code_)
  -> ExampleADT
  -> Domable lock17 payload18
psCodeWithLink' s e ex = D.div_
  [ D.div_
      [ D.a
          Alt.do
            klass_ "text-sm"
            href_
              ( "https://gitpod.io/#START=" <> slug <>
                  "/https://github.com/my-org/repo-to-work-on"
              )
            D.Target !:= "_blank"
          [ text_ "Run on Gitpod" ]
      , D.span
          Alt.do
            klass_ "text-sm"
          [ text_ " | " ]
      , D.a
          Alt.do
            klass_ "text-sm"
            href_
              ( "https://github.com/mikesol/deku-documentation/blob/main/src/Examples/"
                  <> slug
                  <> ".purs"
              )
            D.Target !:= "_blank"
          [ text_ "View on Github" ]
      , D.span
          Alt.do
            klass_ "text-sm"
          [ text_ " | " ]
      , D.code
          Alt.do
            klass_ "text-sm"
          [ text_ $ "START=" <> slug <> " && npm run dev" ]
      ]
  , D.pre
      (D.Class !:= ("prism-code language-purescript" <> s))
      [ D.code e
          [ text_ (exampleToString ex)
          ]
      ]
  ]
  where
  slug = exampleToSlug ex

psCodeWithLink :: forall lock payload. ExampleADT -> Domable lock payload
psCodeWithLink = psCodeWithLink' "" empty

psCodeNoCollapseWithLink
  :: forall lock payload. ExampleADT -> Domable lock payload
psCodeNoCollapseWithLink = psCodeWithLink' " no-collapse" (klass_ "no-collapse")
