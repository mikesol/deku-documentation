module Pages.CoreConcepts.Portals.LocalPortals.UnlockingLevels where

import Prelude

import Components.Code (psCodeWithLink)
import Contracts (Subsection, subsection)
import Data.Foldable (oneOf)
import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (:=))
import Deku.Attributes (klass_)
import Deku.Control (globalPortal1, guard, portal1, text, text_, (<#~>))
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useHot, useState)
import Deku.Listeners (click, click_)
import Effect (Effect)
import Examples as Examples
import FRP.Event (Event)
import QualifiedDo.Alt as Alt
import Web.HTML.HTMLMediaElement (play)
import Web.HTML.HTMLVideoElement (toHTMLMediaElement)

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

myVideo :: forall lock payload. Event Boolean -> String -> Domable lock payload
myVideo bang vid = D.video
  ( oneOf
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

unlockingLevels :: forall lock payload. Subsection lock payload
unlockingLevels = subsection
  { title: "Unlocking levels"
  , matter: pure
      [ D.p_
          [ text_
              "Local portals have one big advantage over global portals: they get cleaned up when the last reference to them is deleted. Because global portals can be used "
          , D.i__ "anywhere"
          , text_
              " in your application at any time, it's impossible to know when they can be safely deleted. Local portals, on the other hand, are tied to the scope in which they are created and cannot be used at a higher scope. If you try, for example by sending them to a hook, you'll get a type error."
          ]

      , D.p_
          [ text_
              "Portals from a higher scope, on the other hand, can be used in a lower scope because, by definition, for the lower scope to exist, the higher scope must still exist. However, to use portals at lower scopes, you need to pass them through a function that validates their type. This function is the right side of the tuple in the closure passed to"
          , D.code__ "portal1"
          , text_ "."
          ]
      , D.p_
          [ text_
              "In the code below, note how we use this mechanism to call "
          , D.code__ "lowerVid"
          , text_
              " when we want to use the video "
          , D.code__ "globalVid"
          , text_ " from the higher scope inside of the lower scope."
          ]
      , psCodeWithLink Examples.UnlockingLevels
      , D.p__
          "In the example below, make sure to try all the controls. Send the top video down, bring the video back up again, shuffle the inner videos, etc. While you can't see it, know that every time you click shuffle video, the inner video object's memory is released when it is replaced."
      , Deku.do
          setVideoURL /\ videoURL <- useHot Video1
          setGlobalVideoPresence /\ globalVideoPresence <- useHot true
          let
            rotator Video1 = Video2
            rotator Video2 = Video3
            rotator Video3 = Video4
            rotator Video4 = Video1
          globalPortal1
            ( myVideo (pure true)
                "https://media.giphy.com/media/3o6Zt6GFP75DlxnDXy/giphy.mp4"
            )
            \globalVid -> D.div_
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
                  [ videoURL <#~> \v -> portal1
                      (myVideo globalVideoPresence (vid2URL v))
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
      ]
  }
