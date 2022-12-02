module Pages.Introduction.GettingStarted.WhyDeku where

import Prelude

import Contracts (Section, section)
import Control.Alt ((<|>))
import Deku.Attribute ((!:=))
import Deku.Attributes (href_)
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
      , D.p_
          [ text_
              "Additionally, this documentation was created with Deku and is available on "
          , D.a
              ( href_ "https://github.com/mikesol/deku-documentation"
                  <|> (D.Target !:= "_blank")
              )
              [ text_ "GitHub" ]
          , text_
              ". It is built with best practices in mind for anyone who groks things by reading code more than or in addition to reading docs!"
          ]
      ]
  , subsections:
      []
  }
