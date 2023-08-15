module Examples.TheLocalPortalSyntax where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (portal1, text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody')
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (Poll)

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

myVideo :: Nut
myVideo = D.video
  [ D.Width !:= "175"
  , D.Height !:= "175"
  , D.Autoplay !:= "true"
  , D.Loop !:= "true"
  , D.Muted !:= "true"
  ]
  [ D.source
      [ D.Src !:= "https://media.giphy.com/media/IMSq59ySKydYQ/giphy.mp4" ]
      []
  ]

app :: ExampleSignature
app runExample = runExample Deku.do
  vid <- portal1 myVideo
  setSquare /\ square <- useState TL
  D.div [ klass_ "grid grid-cols-2" ]
    [ moveSpriteHere { video: vid, square, setSquare, at: TL }
    , moveSpriteHere { video: vid, square, setSquare, at: TR }
    , moveSpriteHere { video: vid, square, setSquare, at: BL }
    , moveSpriteHere { video: vid, square, setSquare, at: BR }
    ]

main :: Effect Unit
main = void $ app (map (map void) runInBody')