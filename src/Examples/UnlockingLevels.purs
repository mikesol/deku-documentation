module Examples.UnlockingLevels where

import Prelude

import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (:=))
import Deku.Attributes (klass_)
import Deku.Control (globalPortal1, portal1, text, text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useHot, useState, (<#~>))
import Deku.Listeners (click, click_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (Poll)
import Web.HTML.HTMLMediaElement (play)
import Web.HTML.HTMLVideoElement (toHTMLMediaElement)

data Square = TL | BL | TR | BR

derive instance Eq Square

moveSpriteHere
  :: { video :: Nut
     , square :: Poll Square
     , setSquare :: Square -> Effect Unit
     , at :: Square
     }
  -> Nut
moveSpriteHere { video, square, setSquare, at } = D.a
  [ click_ (setSquare at)
  , D.Class !:=
      "block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700"
  ]
  [ D.h5
      [ D.Class !:=
          "cursor-pointer mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
      ]
      [ text_ "Move sprite here"
      , guard (square <#> (_ == at)) video
      ]
  ]

vid2URL :: WhichVideo -> String
vid2URL Video1 = "https://media.giphy.com/media/IMSq59ySKydYQ/giphy.mp4"
vid2URL Video2 = "https://media.giphy.com/media/3o6UB7jHQYIjeh5IGY/giphy.mp4"
vid2URL Video3 = "https://media.giphy.com/media/12GbJUnssN6NTa/giphy.mp4"
vid2URL Video4 = "https://media.giphy.com/media/7T8LajxmBkz8gmYcRB/giphy.mp4"

myVideo :: Poll Boolean -> String -> Nut
myVideo bang vid = D.video
  [ D.Width !:= "175"
  , D.Height !:= "175"
  , D.Autoplay !:= "true"
  , D.Loop !:= "true"
  , D.Muted !:= "true"
  , bang <#> \tf -> D.SelfT := \e ->
      if not tf then pure unit
      else do
        let melt = toHTMLMediaElement e
        play melt
  ]
  [ D.source [ D.Src !:= vid ] []
  ]

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mr-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

data WhichVideo = Video1 | Video2 | Video3 | Video4

app :: ExampleSignature
app runExample = runExample Deku.do
  setVideoURL /\ videoURL <- useHot Video1
  setGlobalVideoPresence /\ globalVideoPresence <- useHot true
  let
    rotator Video1 = Video2
    rotator Video2 = Video3
    rotator Video3 = Video4
    rotator Video4 = Video1
  globalVid <- globalPortal1
    ( myVideo (pure true)
        "https://media.giphy.com/media/3o6Zt6GFP75DlxnDXy/giphy.mp4"
    )
  D.div_
    [ D.div [ klass_ "flex" ]
        [ guard globalVideoPresence $ D.button
            [ klass_ $ buttonClass "indigo"
            , click $ videoURL <#> rotator >>> setVideoURL
            ]
            [ text_ "Shuffle video" ]
        , D.button
            [ klass_ $ buttonClass "indigo"
            , click $ globalVideoPresence <#> not >>>
                setGlobalVideoPresence
            ]
            [ text $ globalVideoPresence <#>
                if _ then "Send this video down ->"
                else "Bring video back up"
            ]
        , guard globalVideoPresence globalVid
        ]
    , D.div_
        [ videoURL <#~> \v -> Deku.do
            vid <- portal1 (myVideo globalVideoPresence (vid2URL v))

            setSquare /\ square <- useState TL
            let
              switchable = globalVideoPresence <#~>
                if _ then vid else globalVid
            D.div [ klass_ "grid grid-cols-2" ]
              [ moveSpriteHere
                  { video: switchable, square, setSquare, at: TL }
              , moveSpriteHere
                  { video: switchable, square, setSquare, at: TR }
              , moveSpriteHere
                  { video: switchable, square, setSquare, at: BL }
              , moveSpriteHere
                  { video: switchable, square, setSquare, at: BR }
              ]
        ]
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')