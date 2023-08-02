module Pages.AdvancedUsage.SSR.RenderingAStaticSite.HowEffectsAreHandled where

import Prelude

import Components.Code (htmlCode, psCodeNoCollapseWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Monad.ST (run)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (guard, text)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)
import Deku.Toplevel (runSSR)
import Examples as Examples
import QualifiedDo.Alt as Alt

myApp :: String -> Nut
myApp s = Deku.do
  setImage /\ image <- useState'
  D.div_
    [ D.h4__ "Hi!"
    , D.a
        [ klass "cursor-pointer"
        , click Alt.do
            pure (setImage unit)
            image $> pure unit
        ]
        [ text "Click to reveal an image." ]
    , guard (image $> true) (D.img [ D.Src := "https://picsum.photos/150" ] [])
    , htmlCode s
    ]

howEffectsAreHandled :: Subsection
howEffectsAreHandled = subsection
  { title: "How effects are handled"
  , matter: pure
      [ D.p_
          [ text
              "The Deku SSR engine is smart enough to drop all effectful elements like click listeners and all parts of the DOM that are created using effects, like for example an image that is only created when a click event occurs."
          ]
      , psCodeNoCollapseWithLink Examples.EffectsInSSR
      , exampleBlockquote
          [ do
              myApp
                (run (runSSR (myApp "innnceeeppption")))
          ]

      ]
  }
