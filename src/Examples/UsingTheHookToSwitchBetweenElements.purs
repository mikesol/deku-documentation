module Examples.UsingTheHookToSwitchBetweenElements where

import Prelude

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.DOM.SVG as DS
import Deku.DOM.SVG.Attributes as DSA
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (useState, (<#~>))
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2 mx-1
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

data Element = Image | Video | SVG

bunny :: String
bunny = "https://dl8.webmfiles.org/big-buck-bunny_trailer.webm"

pic :: String
pic = "https://picsum.photos/150"

app :: ExampleSignature
app runExample = runExample.t Deku.do
  setImageType /\ imageType <- useState Image
  D.div_
    [ D.div_
        [ imageType <#~>
            case _ of
              Image -> D.img [ DA.src_ pic ] []
              Video -> D.video
                [ DA.controls_ "controls"
                , DA.preload_ "none"
                , DA.width_ "250"
                , DA.height_ "250"
                , DA.autoplay_ "true"
                ]
                [ D.source
                    [ DA.src_ bunny
                    , DA.xtype_ "video/webm"
                    ]
                    []
                ]
              SVG -> DS.svg
                [ DSA.height_ "170"
                , DSA.width_ "170"
                ]
                [ DS.circle
                    [ DSA.cx_ "75"
                    , DSA.cy_ "75"
                    , DSA.r_ "70"
                    , DSA.stroke_ "black"
                    , DSA.strokeWidth_ "3"
                    , DSA.fill_ "red"
                    ]
                    []
                ]
        ]
    , D.div_
        [ D.button
            [ DA.klass_ $ buttonClass "amber"
            , DL.click_ \_ -> setImageType Image
            ]
            [ text_ "Image" ]
        , D.button
            [ DA.klass_ $ buttonClass "cyan"
            , DL.click_ \_ -> setImageType Video
            ]
            [ text_ "Video" ]
        , D.button
            [ DA.klass_ $ buttonClass "green"
            , DL.click_ \_ -> setImageType SVG
            ]
            [ text_ "SVG" ]
        ]
    ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }