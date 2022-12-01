module Pages.CoreConcepts.Portals.LocalPortals.UnlockingLevels where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Data.Foldable (oneOf)
import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (guard, portal1, text, text_, (<#~>))
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useHot, useState)
import Deku.Listeners (click, click_)
import Effect (Effect)
import FRP.Event (Event)
import QualifiedDo.Alt as Alt

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

vid2URL :: WhichVideo -> String
vid2URL Video1 = "https://media.giphy.com/media/IMSq59ySKydYQ/giphy.mp4"
vid2URL Video2 = "https://media.giphy.com/media/3o6UB7jHQYIjeh5IGY/giphy.mp4"
vid2URL Video3 = "https://media.giphy.com/media/12GbJUnssN6NTa/giphy.mp4"
vid2URL Video4 = "https://media.giphy.com/media/7T8LajxmBkz8gmYcRB/giphy.mp4"

myVideo :: forall lock payload. String -> Domable lock payload
myVideo vid = D.video
  ( oneOf
      [ D.Width !:= "175"
      , D.Height !:= "175"
      , D.Autoplay !:= "true"
      , D.Loop !:= "true"
      , D.Muted !:= "true"
      ]
  )
  [ D.source (D.Src !:= vid)
      []
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

example :: String
example =
  """module Main where

import Prelude

import Data.Foldable (oneOf)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (portal1, guard, text_)
import Deku.Core (Domable, Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
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

main :: Effect Unit
main = runInBody Deku.do
  portal1 myVideo \(vid /\ _) -> Deku.do
    setSquare /\ square <- useState TL
    D.div (klass_ "grid grid-cols-2")
      [ moveSpriteHere { video: vid, square, setSquare, at: TL }
      , moveSpriteHere { video: vid, square, setSquare, at: TR }
      , moveSpriteHere { video: vid, square, setSquare, at: BL }
      , moveSpriteHere { video: vid, square, setSquare, at: BR }
      ]"""

unlockingLevels :: forall lock payload. Subsection lock payload
unlockingLevels = subsection
  { title: "Unlocking levels"
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
      , psCode example
      , D.p__ "This yields a similar result as the one above."
      , Deku.do
          setVideoURL /\ videoURL <- useState Video1
          setGlobalVideoPresence /\ globalVideoPresence <- useHot true
          let
            rotator Video1 = Video2
            rotator Video2 = Video3
            rotator Video3 = Video4
            rotator Video4 = Video1
          portal1
            ( myVideo
                "https://media.giphy.com/media/3o6Zt6GFP75DlxnDXy/giphy.mp4"
            )
            \(globalVid /\ _) -> D.div_
              [ D.div (klass_ "flex")
                  [ guard globalVideoPresence $ D.button
                      Alt.do
                        klass_ $ buttonClass "indigo"
                        click $ videoURL <#> rotator >>> setVideoURL
                      [ text_ "Shuffle video" ]
                  , D.button
                      Alt.do
                        klass_ $ buttonClass "indigo"
                        click $ globalVideoPresence <#> not >>>
                          setGlobalVideoPresence
                      [ text $ globalVideoPresence <#>
                          if _ then "Send this video down ->"
                          else "Bring video back up"
                      ]
                  , guard globalVideoPresence globalVid
                  ]
              , D.div_
                  [ videoURL <#~> \v -> portal1 (myVideo (vid2URL v))
                      \(vid /\ lowerVid) -> Deku.do
                        setSquare /\ square <- useState TL
                        let
                          switchable = globalVideoPresence <#~>
                            if _ then vid else (lowerVid globalVid)
                        D.div (klass_ "grid grid-cols-2")
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
      , D.p_
          [ text_
              "Aside from these differences, local portals look a lot like global ones. However, for a bit extra syntax, you get better performance. Let's see how in the next section."
          ]
      ]
  }
