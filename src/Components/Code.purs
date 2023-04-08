module Components.Code where

import Prelude

import Clipboard (copyToClipboard)
import Components.Toast (toast)
import Control.Plus (empty)
import Deku.Attribute (Attribute, (!:=))
import Deku.Attributes (href_, klass_)
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Listeners (click_)
import Effect.Random (random)
import Examples (ExampleADT, exampleToSlug, exampleToString)
import FRP.Event (Event)

jsCode :: String -> Nut
jsCode code = D.pre [ D.Class !:= "prism-code language-javascript" ]
  [ D.code_
      [ text_ code
      ]
  ]

htmlCode :: String -> Nut
htmlCode code = D.pre [ D.Class !:= "prism-code language-markup" ]
  [ D.code_
      [ text_ code
      ]
  ]

shSessionCode :: String -> Nut
shSessionCode code = D.pre [ D.Class !:= "prism-code language-sh-session" ]
  [ D.code_ [ text_ code ] ]

-- 
psCode'
  :: String
  -> Event (Attribute D.Code_)
  -> String
  -> Nut
psCode' s e code = D.pre
  [ D.Class !:= ("prism-code language-purescript" <> s) ]
  [ D.code [ e ]
      [ text_ code
      ]
  ]

psCode :: String -> Nut
psCode = psCode' "" empty

psCodeNoCollapse :: String -> Nut
psCodeNoCollapse = psCode' " no-collapse" (klass_ "no-collapse")

--
psCodeWithLink'
  :: String
  -> Event (Attribute D.Code_)
  -> ExampleADT
  -> Nut
psCodeWithLink' s e ex = D.div_
  [ D.div_
      [ D.a
          [ klass_ textSize
          , href_
              ( "https://gitpod.io/#VITE_START=" <> slug <> ",VITE_GOTO="
                  <> gitpodGoto
                  <>
                    "/https://github.com/mikesol/deku-documentation"
              )
          , D.Target !:= "_blank"
          ]
          [ text_ "Run on Gitpod" ]
      , D.span [ klass_ textSize ]
          [ text_ " | " ]
      , D.a
          [ klass_ textSize
          , href_
              ( "https://github.com/mikesol/deku-documentation/blob/main/src/Examples/"
                  <> slug
                  <> ".purs"
              )
          , D.Target !:= "_blank"
          ]
          [ text_ "View on Github" ]
      , D.span
          [ klass_ textSize ]
          [ text_ " | " ]
      , D.code
          [ klass_ textSize ]
          [ text_ startTxt ]
      , D.button
          [ click_ do
              copyToClipboard startTxt
              r <- random
              let
                emoji
                  | r < 0.2 = "🚀"
                  | r < 0.4 = "✨"
                  | r < 0.6 = "😎"
                  | r < 0.8 = "💪"
                  | otherwise = "🤘"
              toast $ "Copied " <> emoji
          ]
          [ D.svg
              [ D.Fill !:= "none"
              , D.ViewBox !:= "0 0 24 24"
              , D.StrokeWidth !:= "1.5"
              , D.Stroke !:= "currentColor"
              , D.Class !:= "w-4 h-4"
              ]
              [ D.path
                  [ D.StrokeLinecap !:= "round"
                  , D.StrokeLinejoin !:= "round"
                  , D.D !:=
                      "M8.25 7.5V6.108c0-1.135.845-2.098 1.976-2.192.373-.03.748-.057 1.123-.08M15.75 18H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08M15.75 18.75v-1.875a3.375 3.375 0 00-3.375-3.375h-1.5a1.125 1.125 0 01-1.125-1.125v-1.5A3.375 3.375 0 006.375 7.5H5.25m11.9-3.664A2.251 2.251 0 0015 2.25h-1.5a2.251 2.251 0 00-2.15 1.586m5.8 0c.065.21.1.433.1.664v.75h-6V4.5c0-.231.035-.454.1-.664M6.75 7.5H4.875c-.621 0-1.125.504-1.125 1.125v12c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V16.5a9 9 0 00-9-9z"
                  ]
                  []
              ]
          ]
      ]
  , D.pre
      [ D.Class !:= ("prism-code language-purescript" <> s) ]
      [ D.code [ e ]
          [ text_ (exampleToString ex)
          ]
      ]
  ]
  where
  slug = exampleToSlug ex
  textSize = "text-sm"
  startTxt = "VITE_START=" <> slug <> " pnpm dev"
  gitpodGoto = ".%2Fsrc%2FExamples%2F" <> slug <> ".purs"

psCodeWithLink :: ExampleADT -> Nut
psCodeWithLink = psCodeWithLink' "" empty

psCodeNoCollapseWithLink
  :: ExampleADT -> Nut
psCodeNoCollapseWithLink = psCodeWithLink' " no-collapse" (klass_ "no-collapse")
