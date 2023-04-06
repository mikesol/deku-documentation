module Pages.CoreConcepts.Pursx.ASimpleExample.TypeSafety where

import Prelude

import Components.Code (psCode, shSessionCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

typeSafety :: Subsection
typeSafety = subsection
  { title: "Type safety"
  , matter: pure
      [ D.p_
          [ text_
              "Going back to our HTML string, you'll see that it's actually not a "
          , D.code__ "String"
          , text_ " in the \"the type of this term is "
          , D.code__ "String"
          , text_ "\" sense of the term. Instead, it's of type "
          , D.code__ "Proxy html"
          , text_ ", where "
          , D.code__ "html"
          , text_ " is a "
          , D.code__ "Symbol"
          , text_ " (aka a type-level "
          , D.code__ "String"
          , text_ ") containing your HTML. That is, the "
          , D.code__ "Proxy"
          , text_ " type constructor is parameterized by your HTML, much as "
          , D.code__ "Array"
          , text_ " can be parameterized by "
          , D.code__ "Int"
          , text_ " or "
          , D.code__ "String"
          , text_ " or "
          , D.code__ "Nu Maybe"
          , text_ "."
          ]
      , D.p_
          [ text_
              "By using a type to specify the HTML, Deku can validate it at "
          , D.i__ "compile time"
          , text_
              " instead of at runtime. That means you do not need to eat up precious CPU cycles in the browser "
          , D.i__ "and"
          , text_
              " you'll weed out errors earlier. If the HTML isn't valid, your program won't compile."
          ]
      , D.p_
          [ text_
              "Let's see a concrete example of this. Say I try to compile the following Deku program with malformed HTML."
          ]
      , psCode
          """main :: Effect Unit
main = runInBody ((Proxy :: Proxy
    "<h1><span>hi<span></h1>") ~~ {})"""
      , D.p_ [ text_ "The compiler complains with the following message." ]
      , shSessionCode
          """  Could not match type

    "h1"

  with type

    "span"
"""
      , D.p_
          [ text_
              "While the message could be better by identifying line numbers (we're working on this...), it identifies the HTML tag mismatch that needs to be corrected. Once we correct it, the program compiles!"
          ]
      ]
  }
