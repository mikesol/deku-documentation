module Pages.Introduction.GettingStarted.WhyDeku where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.DOM as D

whyDeku :: forall lock payload. Section lock payload
whyDeku = section
  { title: "Why Deku"
  , topmatter: pure
      [ D.p_
          [ text_
              "Deku was originally created and used for HTML5-based musical instruments. It has since been used to create several games and interactive websites."
          ]
      , D.p_
          [ text_
              "If you're building a game or a complex web app and would like to create it using a functional style of programming, Deku is a great fit! It is fast, accurate, and encourages the use of expressive and efficient patterns for building web apps."
          ]
      ]
  , subsections:
      []
  }
