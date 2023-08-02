module Examples.TheLocalPortalSyntax where

import Deku.Toplevel (runInBody)
import Prelude

import Data.NonEmpty (NonEmpty)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (portal1, text)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState)
import Deku.Listeners (click)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (Event)

data Square = TL | BL | TR | BR

derive instance Eq Square

moveSpriteHere
  :: { video :: Nut
     , square :: NonEmpty Event Square
     , setSquare :: Square -> Effect Unit
     , at :: Square
     }
  -> Nut
moveSpriteHere { video, square, setSquare, at } = D.a
  [ click (setSquare at)
  , D.Class :=
      "block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700"
  ]
  [ D.h5
      [ D.Class :=
          "cursor-pointer mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
      ]
      [ text "Move sprite here"
      , guard (square <#> (_ == at)) video
      ]
  ]

myVideo :: Nut
myVideo = D.video
  [ D.Width := "175"
  , D.Height := "175"
  , D.Autoplay := "true"
  , D.Loop := "true"
  , D.Muted := "true"
  ]
  [ D.source
      [ D.Src := "https://media.giphy.com/media/IMSq59ySKydYQ/giphy.mp4" ]
      []
  ]

main :: ExampleSignature
main runExample = runExample Deku.do
  vid <- portal1 myVideo
  setSquare /\ square <- useState TL
  D.div [ klass "grid grid-cols-2" ]
    [ moveSpriteHere { video: vid, square, setSquare, at: TL }
    , moveSpriteHere { video: vid, square, setSquare, at: TR }
    , moveSpriteHere { video: vid, square, setSquare, at: BL }
    , moveSpriteHere { video: vid, square, setSquare, at: BR }
    ]