module Examples.UsingTheHookToSwitchBetweenElements where

import Deku.Toplevel (runInBody)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState, (<#~>))
import Deku.Listeners (click)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

data Element = Image | Video | SVG

bunny :: String
bunny = "https://dl8.webmfiles.org/big-buck-bunny_trailer.webm"

pic :: String
pic = "https://picsum.photos/150"

main :: ExampleSignature
main runExample = runExample Deku.do
  setImageType /\ imageType <- useState Image
  D.div_
    [ D.div_
        [ imageType <#~>
            case _ of
              Image -> D.img [ D.Src := pic ] []
              Video -> D.video
                [ D.Controls := "controls"
                , D.Preload := "none"
                , D.Width := "250"
                , D.Height := "250"
                , D.Autoplay := "true"
                ]
                [ D.source
                    [ D.Src := bunny
                    , D.Xtype := "video/webm"
                    ]
                    []
                ]
              SVG -> D.svg
                [ D.Height := "170"
                , D.Width := "170"
                ]
                [ D.circle
                    [ D.Cx := "75"
                    , D.Cy := "75"
                    , D.R := "70"
                    , D.Stroke := "black"
                    , D.StrokeWidth := "3"
                    , D.Fill := "red"
                    ]
                    []
                ]
        ]
    , D.div_
        [ D.button
            [ klass $ buttonClass "amber"
            , click $ setImageType Image
            ]
            [ text "Image" ]
        , D.button
            [ klass $ buttonClass "cyan"
            , click $ setImageType Video
            ]
            [ text "Video" ]
        , D.button
            [ klass $ buttonClass "green"
            , click $ setImageType SVG
            ]
            [ text "SVG" ]
        ]
    ]