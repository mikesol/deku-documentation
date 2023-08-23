module Examples.TheGlobalPortalSyntax where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (globalPortal1, text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState)
import Deku.DOM.Listeners as DL
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
  [ DL.click_ \_ -> (setSquare at)
  , DA.klass_
      "block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700"
  ]
  [ D.h5
      [ DA.klass_
          "cursor-pointer mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
      ]
      [ text_ "Move sprite here"
      , guard (square <#> (_ == at)) video
      ]
  ]

myVideo :: Nut
myVideo = D.video
  [ DA.width_ "175"
  , DA.height_ "175"
  , DA.autoplay_ "true"
  , DA.loop_ "true"
  , DA.muted_ "true"
  ]
  [ D.source
      [ DA.src_ "https://media.giphy.com/media/IMSq59ySKydYQ/giphy.mp4" ]
      []
  ]

app :: ExampleSignature
app runExample = runExample.t Deku.do
  vid <- globalPortal1 myVideo
  setSquare /\ square <- useState TL
  D.div [ DA.klass_ "grid grid-cols-2" ]
    [ moveSpriteHere { video: vid, square, setSquare, at: TL }
    , moveSpriteHere { video: vid, square, setSquare, at: TR }
    , moveSpriteHere { video: vid, square, setSquare, at: BL }
    , moveSpriteHere { video: vid, square, setSquare, at: BR }
    ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }