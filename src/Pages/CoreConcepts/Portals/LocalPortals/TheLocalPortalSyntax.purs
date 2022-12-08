module Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalSyntax where

import Prelude

import Components.Code (psCodeWithLink)
import Contracts (Subsection, subsection)
import Data.Foldable (oneOf)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (guard, portal1, text_)
import Deku.Core (Domable, Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Effect (Effect)
import Examples as Examples
import FRP.Event (Event)

data Square = TL | BL | TR | BR

derive instance Eq Square

moveSpriteHere
  :: forall lock payload
   . { video :: Domable lock payload
     , square :: Event Square
     , setSquare :: Square -> Effect Unit
     , at :: Square
     }
  -> Domable lock payload
moveSpriteHere { video, square, setSquare, at } = D.a
  ( oneOf
      [ click_ (setSquare at)
      , D.Class !:=
          "block max-w-sm p-6 bg-white border border-gray-200 rounded-lg shadow-md hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700"
      ]
  )
  [ D.h5
      ( D.Class !:=
          "cursor-pointer mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
      )
      [ text_ "Move sprite here"
      , guard (square <#> (_ == at)) video
      ]
  ]

myVideo :: Nut
myVideo = D.video
  ( oneOf
      [ D.Width !:= "175"
      , D.Height !:= "175"
      , D.Autoplay !:= "true"
      , D.Loop !:= "true"
      , D.Muted !:= "true"
      ]
  )
  [ D.source (D.Src !:= "https://media.giphy.com/media/IMSq59ySKydYQ/giphy.mp4")
      []
  ]

theLocalPortalSyntax :: forall lock payload. Subsection lock payload
theLocalPortalSyntax = subsection
  { title: "The local portal syntax"
  , matter: pure
      [ D.p_
          [ text_
              "Local portals look a lot like global portals with two important caveats."
          , D.ol_
              [ D.li_
                  [ text_
                      "They must be written as functions instead of using the "
                  , D.code__ "do"
                  , text_ " syntax with a left bind."
                  ]
              , D.li_
                  [ text_
                      "They output a additional parameter in addition to the component. We'll see what that parameter is a bit later, but for now we'll ignore it."
                  ]
              ]
          ]
      , psCodeWithLink Examples.TheLocalPortalSyntax
      , D.p__ "This yields a similar result as the one above."
      , portal1 myVideo \(vid /\ _) -> Deku.do
          setSquare /\ square <- useState TL
          D.div (klass_ "grid grid-cols-2")
            [ moveSpriteHere { video: vid, square, setSquare, at: TL }
            , moveSpriteHere { video: vid, square, setSquare, at: TR }
            , moveSpriteHere { video: vid, square, setSquare, at: BL }
            , moveSpriteHere { video: vid, square, setSquare, at: BR }
            ]
      , D.p_
          [ text_
              "Aside from these differences, local portals look a lot like global ones. However, for a bit extra syntax, you get better performance. To understand why it's more performant, we'll use a slightly more involved example in the next section."
          ]
      ]
  }
