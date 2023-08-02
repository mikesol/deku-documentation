module Pages.Introduction.HelloWorld.TheAnatomyOfHello.Imports where

import Prelude

import Components.Code (psCode)
import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

imports :: Subsection
imports = subsection
  { title: "Imports"
  , matter: pure
      [ psCode
          """import Prelude

import Deku.Control (text)
import Deku.Toplevel (runInBody)
import Effect (Effect)"""
      , D.p_
          [ text
              "PureScript, like Java and Haskell, has a pretty tiny core language. That means that, to get most things done, you'll need to import a few types and terms from various libraries."
          ]
      , D.p_
          [ text
              "The convention in PureScript is to import the language's Prelude in an "
          , D.i_ [ text "unqualified" ]
          , text " format, meaning that "
          , D.i_ [ text "everything" ]
          , text
              " from the Prelude winds up getting imported. This is because the Prelude's content is a veritable "
          , D.i_ [ text "Greatest Hits of Functional Programming" ]
          , text
              " and you'll likely need much of it to get stuff done."
          ]
      , proTip
          { header: text "Prelude etiquette"
          , message: D.div_
              [ text
                  "Try not to define something using a word that's already used in the Prelude. For example, the word "
              , D.code_ [ text "map" ]
              , text
                  " has such a strong connotation in PureScript's Prelude that it's usually a good idea to avoid defining something with that name, even if the language technically allows you."
              ]
          }
      , D.p_
          [ text
              "After this, there are three more imports, all of which will be crucial in any Deku app of repute."
          , D.ul_
              [ D.li_
                  [ D.code_ [ text "text" ]
                  , text ": A way to write a text string to the DOM."
                  ]
              , D.li_
                  [ D.code_ [ text "runInBody" ]
                  , text
                      ": Takes the current Deku program and inserts it into the body of a webpage."
                  ]
              , D.li_
                  [ D.code_ [ text "Effect" ]
                  , text
                      ": The monad that a Deku program runs in. If you don't know what a monad is, you can think of it as a computational context. "
                  , D.code_ [ text "Effect" ]
                  , text
                      " is a context that accounts for various side effects like changing the dom and/or JavaScript errors arising, which is a danger in most web apps. I personally have never written any code with errors before, but some of my friends have, and they tell me it's not that bad."
                  ]
              ]
          ]
      , D.p_
          [ text "Lastly, "
          , D.code_ [ text "Effect Unit" ]
          , text " means that the computational context of "
          , D.code_ [ text "Effect" ]
          , text " returns a dummy value of "
          , D.code_ [ text "Unit" ]
          , text " if and when the program stops executing."
          ]
      ]
  }
