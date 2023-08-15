module Pages.Introduction.GettingStarted.WhyDeku where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Section, section)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Attributes (href)
import Deku.Control (text, text_)
import Deku.DOM as D

whyDeku :: Section
whyDeku = section
  { title: "Why Deku"
  , topmatter: pure
      [ D.p_
          [ text
              "Deku was originally created to develop HTML5-based musical instruments. It has since been used to create several games and interactive websites."
          ]
      , D.p_
          [ text
              "If you're building a game or a complex web app and would like to create it using a functional style of programming, Deku is a great fit! It is fast, accurate, and encourages the use of expressive and efficient patterns for building web apps."
          ]
      , D.p_
          [ text
              "This documentation was created with Deku and is available on "
          , D.a
              [href "https://github.com/mikesol/deku-documentation"
                  ,D.Target !:= "_blank"
              ]
              [ text_ "GitHub" ]
          , text
              ". It was built with best practices in mind and is a useful reference for building larger applications, as is the "
          , targetedLink "https://deku-realworld.netlify.app"
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
