module Pages.Introduction.HelloWorld.SayingHello.TheCode where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

theCode :: forall lock payload. Subsection lock payload
theCode = subsection
  { title: "The code"
  , matter: pure
      [ D.p_
          [ text_
              "Here it is, what you've all been eagerly waiting for. Helloooo world!"
          ]
      , psCode
          """module Main where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody (text_ "Hello world")"""
      ]
  }
