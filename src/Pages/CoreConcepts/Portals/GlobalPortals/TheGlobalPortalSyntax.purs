module Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalSyntax where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (globalPortal1, guard, text)
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

theGlobalPortalSyntax :: Subsection
theGlobalPortalSyntax = subsection
  { title: "The global portal syntax"
  , matter: pure
      [ D.p_
          [ text
              "The global portal syntax looks a lot like the hooks syntax. We use a left-bind in a "
          , D.code__ "Deku.do"
          , text
              " bloc to create a value that will be used later. But instead of creating a hook, we create a component. In the example below, look how "
          , D.code__ "globalPortal1"
          , text
              "is used to create a single component that is consumed by other components."
          ]
      , psCodeWithLink Examples.TheGlobalPortalSyntax
      , D.p__ "And, as y'all know, the result is the following."
      , Deku.do
          vid <- globalPortal1 myVideo
          setSquare /\ square <- useState TL
          D.div [klass "grid grid-cols-2"]
            [ moveSpriteHere { video: vid, square, setSquare, at: TL }
            , moveSpriteHere { video: vid, square, setSquare, at: TR }
            , moveSpriteHere { video: vid, square, setSquare, at: BL }
            , moveSpriteHere { video: vid, square, setSquare, at: BR }
            ]
      , D.p_
          [ text
              "While using a portal looks like using a vanilla Deku node, don't let it fool you! These two snippets are different: "
          ]
      , psCode
          """let a = Deku.div_ [ text "hi" ]
a <- globalPortal1 (Deku.div_ [ text "hi" ])"""
      , D.p_
          [ text
              "Portals are created with a left bind, and as such are referentially opaque. That means that, when a portal is created, it represents "
          , D.i__ "a single DOM node that exists"
          , text ", as opposed to a template for a DOM node."
          ]
      , D.p__
          "Relating this concept to the example above, let's zoom in on the following line of code:"
      , psCode "vid <- globalPortal1 myVideo"
      , D.p_
          [ text "The term "
          , D.code__ "vid"
          , text
              " is one single instantiation of our video. On the other hand, if we had passed "
          , D.code__ "myVideo"
          , text " to the "
          , D.code__ "moveSpriteHere"
          , text
              " function, we would be working with a referentially transparent object that acts as a blueprint for a node to construct as opposed to an actual node."
          ]
      , D.p__
          "Because DOM nodes can only appear in one place in the DOM, when a portal is used multiple times, the behavior is undefined. For that reason, in your application logic, it is important to make sure that a portal only ever appears in at most one place."
      ]
  }
