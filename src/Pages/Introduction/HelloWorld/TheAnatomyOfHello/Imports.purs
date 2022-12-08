module Pages.Introduction.HelloWorld.TheAnatomyOfHello.Imports where

import Prelude

import Components.Code (psCode)
import Components.ProTip (proTip)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

imports :: forall lock payload. Subsection lock payload
imports = subsection
  { title: "Imports"
  , matter: pure
      [ psCode
          """import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)"""
      , D.p_
          [ text_
              "PureScript, like Java and Haskell, has a pretty tiny core language. That means that, to get most things done, you'll need to import a few types and terms from various libraries."
          ]
      , D.p_
          [ text_
              "The convention in PureScript is to import the language's Prelude in an "
          , D.i_ [ text_ "unqualified" ]
          , text_ " format, meaning that "
          , D.i_ [ text_ "everything" ]
          , text_
              " from the Prelude winds up getting imported. This is because the Prelude's content is a veritable "
          , D.i_ [ text_ "Greatest Hits of Functional Programming" ]
          , text_
              " and you'll likely need much of it to get stuff done."
          ]
      , proTip
          { header: text_ "Prelude etiquette"
          , message: D.div_
              [ text_
                  "Try not to define something using a word that's already used in the Prelude. For example, the word "
              , D.code_ [ text_ "map" ]
              , text_
                  " has such a strong connotation in PureScript's Prelude that it's usually a good idea to avoid defining something with that name, even if the language technically allows you."
              ]
          }
      , D.p_
          [ text_
              "After this, there are three more imports, all of which will be crucial in any Deku app of repute."
          , D.ul_
              [ D.li_
                  [ D.code_ [ text_ "text_" ]
                  , text_ ": A way to write a text string to the DOM."
                  ]
              , D.li_
                  [ D.code_ [ text_ "runInBody" ]
                  , text_
                      ": Takes the current Deku program and inserts it into the body of a webpage."
                  ]
              , D.li_
                  [ D.code_ [ text_ "Effect" ]
                  , text_
                      ": The monad that a Deku program runs in. If you don't know what a monad is, you can think of it as a computational context. "
                  , D.code_ [ text_ "Effect" ]
                  , text_
                      " is a context that accounts for various side effects like changing the dom and/or JavaScript errors arising, which is a danger in most web apps. I personally have never written any code with errors before, but some of my friends have, and they tell me it's not that bad."
                  ]
              ]
          ]
      , D.p_
          [ text_ "Lastly, "
          , D.code_ [ text_ "Effect Unit" ]
          , text_ " means that the computational context of "
          , D.code_ [ text_ "Effect" ]
          , text_ " returns a dummy value of "
          , D.code_ [ text_ "Unit" ]
          , text_ " if and when the program stops executing."
          ]
      ]
  }
