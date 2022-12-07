module Pages.AdvancedUsage.SSR.RenderingAStaticSite.TheRunSSRFunction where

import Prelude

import Components.Code (htmlCode, psCode, psCodeNoCollapse)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Monad.ST (run)
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Toplevel (runSSR)

myApp :: forall lock payload. String -> Domable lock payload
myApp s = D.div_
  [ D.h4__ "Hi!"
  , D.div__ "Here's some HTML for a Deku app:"
  , htmlCode s
  ]

theRunSSRFunction :: forall lock payload. Subsection lock payload
theRunSSRFunction = subsection
  { title: "The runSSR function"
  , matter: pure
      [ D.p_
          [ text_ "In order to turn a Deku site into a static site, use "
          , D.code__ "runSSR"
          , text_ ". The example below gets all inception-y, calling "
          , D.code__ "runSSR"
          , text_ " on itself in the most gimmicky of ways."
          ]
      , psCodeNoCollapse
          """module Main where

import Prelude

import Components.Code (htmlCode)
import Control.Monad.ST (run)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Toplevel (runInBody, runSSR)
import Effect (Effect)

myApp :: forall lock payload. String -> Domable lock payload
myApp s = D.div_
  [ D.h4__ "Hi!"
  , D.div__ "Here's some HTML for a Deku app:"
  , htmlCode s
  ]

main :: Effect Unit
main = runInBody do
  myApp
    (run (runSSR (myApp "hello")))"""
      , exampleBlockquote
          [ do
              myApp
                (run (runSSR (myApp "hello")))
          ]
      ]
  }
