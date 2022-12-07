module Pages.CoreConcepts.Portals where

import Prelude

import Contracts (Page, page)
import Data.Foldable (oneOf)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (globalPortal1, guard, text_)
import Deku.Core (Domable, Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Effect (Effect)
import FRP.Event (Event)
import Pages.CoreConcepts.Portals.GlobalPortals (globalPortals)
import Pages.CoreConcepts.Portals.LocalPortals (localPortals)
import Router.ADT (Route(..))

data Square = TL | BL | TR | BR

derive instance Eq Square

moveSpriteHere
  :: forall lock payload
   . { iframe :: Domable lock payload
     , square :: Event Square
     , setSquare :: Square -> Effect Unit
     , at :: Square
     }
  -> Domable lock payload
moveSpriteHere { iframe, square, setSquare, at } = D.a
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
      , guard (square <#> (_ == at)) iframe
      ]
  ]

myIframe :: Nut
myIframe = D.video
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

portals :: forall lock payload. Page lock payload
portals = page
  { route: Portals
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "Dealing with stateful DOM components."
          ]
      , D.p_
          [ text_
              "You've read the Deku docs, you're itching to create your first game, and you decide to make a game that involves moving a video sprite from tile to tile. Nice!"
          ]
      , Deku.do
          setSquare /\ square <- useState TL
          D.div (klass_ "grid grid-cols-2")
            [ moveSpriteHere { iframe: myIframe, square, setSquare, at: TL }
            , moveSpriteHere { iframe: myIframe, square, setSquare, at: TR }
            , moveSpriteHere { iframe: myIframe, square, setSquare, at: BL }
            , moveSpriteHere { iframe: myIframe, square, setSquare, at: BR }
            ]
      , D.p__
          "There's one issue, though. Can you spot it? Look closely at the video as it moves from tile to tile. Each time you move it, the video restarts! But we don't want that, we want the video to be continuous as it's jumping from place to place."
      , D.p_
          [ text_ "In games and other multimedia sites, it's common to use "
          , D.code__ "video"
          , text_ ", "
          , D.code__ "audio"
          , text_ ", and "
          , D.code__ "canvas"
          , text_
              " elements that are stateful. It's often the case that these elements stay put in the DOM, so we don't worry about their statefulness. But in cases where we need to move them around, we want to preserve their state. This is where "
          , D.b__ "Portals"
          , text_ " come in."
          ]
      , D.p_
          [ text_
              "Let's redo the example above with portals. As you click on the squares, you'll see that the video continues uninterrupted."
          ]
      , Deku.do
          ifr <- globalPortal1 myIframe
          setSquare /\ square <- useState TL
          D.div (klass_ "grid grid-cols-2")
            [ moveSpriteHere { iframe: ifr, square, setSquare, at: TL }
            , moveSpriteHere { iframe: ifr, square, setSquare, at: TR }
            , moveSpriteHere { iframe: ifr, square, setSquare, at: BL }
            , moveSpriteHere { iframe: ifr, square, setSquare, at: BR }
            ]
      , D.p__
          "The rest of this section will explore various ways to make portals in Deku."
      ]
  , sections:
      [ globalPortals, localPortals ]
  }
