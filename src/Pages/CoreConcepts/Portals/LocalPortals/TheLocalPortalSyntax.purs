module Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalSyntax where

import Prelude

import Components.Code (psCodeWithLink)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (guard, portal1, text)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Effect (Effect)
import Examples as Examples
import FRP.Event (Event)

data Square = TL | BL | TR | BR

derive instance Eq Square

moveSpriteHere
  :: { video :: Nut
     , square :: Event Square
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
      [D.Class :=
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
  [ D.source [D.Src := "https://media.giphy.com/media/IMSq59ySKydYQ/giphy.mp4"]
      []
  ]

theLocalPortalSyntax :: Subsection
theLocalPortalSyntax = subsection
  { title: "The local portal syntax"
  , matter: pure
      [ D.p_
          [ text
              "Local portals look just like global portals."
          ]
      , psCodeWithLink Examples.TheLocalPortalSyntax
      , D.p__ "This yields a similar result as the one above."
      , Deku.do
          vid <- portal1 myVideo
          setSquare /\ square <- useState TL
          D.div [klass "grid grid-cols-2"]
            [ moveSpriteHere { video: vid, square, setSquare, at: TL }
            , moveSpriteHere { video: vid, square, setSquare, at: TR }
            , moveSpriteHere { video: vid, square, setSquare, at: BL }
            , moveSpriteHere { video: vid, square, setSquare, at: BR }
            ]
      , D.p_
          [ text
              "The difference between local and global portals is that you get better performance from local portals with slightly less predictable runtime behavior. To understand why it's more performant, we'll use a slightly more involved example in the next section."
          ]
      ]
  }
