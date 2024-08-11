module Pages.Introduction.GettingStarted.WhyDeku where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Section, section)
import Deku.DOM.Attributes as DA

import Deku.Control (text_)
import Deku.DOM as D

whyDeku :: Section
whyDeku = section
  { title: "Why Deku"
  , topmatter: pure
      [ D.p_
          [ text_
              "Deku was originally created to develop HTML5-based musical instruments. It has since been used to create several games and interactive websites."
          ]
      , D.p_
          [ text_
              "If you’re building a game or a complex web app and would like to create it using a functional style of programming, Deku is a great fit! It is fast, accurate, and encourages the use of expressive and efficient patterns for building web apps."
          ]
      , D.p_
          [ text_
              "This documentation was created with Deku and is available on "
          , D.a
              [ DA.href_ "https://github.com/mikesol/deku-documentation"
              , DA.target_ "_blank"
              ]
              [ text_ "GitHub" ]
          , text_
              ". It was built with best practices in mind and is a useful reference for building larger applications, as is the "
          , targetedLink "https://purescript-deku-realworld.surge.sh"
              [ text_ "Deku Real World" ]
          , text_ " "
          , targetedLink "https://github.com/mikesol/purescript-deku-realworld"
              [ text_ " project" ]
          , text_ "."
          ]
      ]
  , subsections:
      []
  }
