module Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheRunSSRFunction where

import Prelude

import Components.Code (htmlCode, psCodeNoCollapseWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Monad.ST (run)
import Deku.Control (text)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Toplevel (runSSR)
import Examples as Examples

myApp :: String -> Nut
myApp s = D.div_
  [ D.h4__ "Hi!"
  , D.div__ "Here's some HTML for a Deku app:"
  , htmlCode s
  ]

theRunSSRFunction :: Subsection
theRunSSRFunction = subsection
  { title: "The runSSR function"
  , matter: pure
      [ D.p_
          [ text "In order to turn a Deku site into a static site, use "
          , D.code__ "runSSR"
          , text ". The example below gets all inception-y, calling "
          , D.code__ "runSSR"
          , text " on itself in the most gimmicky of ways."
          ]
      , psCodeNoCollapseWithLink Examples.RunSSR
      , exampleBlockquote
          [ do
              myApp
                (run (runSSR (myApp "hello")))
          ]
      ]
  }
