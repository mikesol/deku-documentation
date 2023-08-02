module Pages.CoreConcepts.Pursx.ASimpleExample.TypeSafety where

import Prelude

import Components.Code (psCode, shSessionCode)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

typeSafety :: Subsection
typeSafety = subsection
  { title: "Type safety"
  , matter: pure
      [ D.p_
          [ text
              "Going back to our HTML string, you'll see that it's actually not a "
          , D.code__ "String"
          , text " in the \"the type of this term is "
          , D.code__ "String"
          , text "\" sense of the term. Instead, it's of type "
          , D.code__ "Proxy html"
          , text ", where "
          , D.code__ "html"
          , text " is a "
          , D.code__ "Symbol"
          , text " (aka a type-level "
          , D.code__ "String"
          , text ") containing your HTML. That is, the "
          , D.code__ "Proxy"
          , text " type constructor is parameterized by your HTML, much as "
          , D.code__ "Array"
          , text " can be parameterized by "
          , D.code__ "Int"
          , text " or "
          , D.code__ "String"
          , text " or "
          , D.code__ "Nu Maybe"
          , text "."
          ]
      , D.p_
          [ text
              "By using a type to specify the HTML, Deku can validate it at "
          , D.i__ "compile time"
          , text
              " instead of at runtime. That means you do not need to eat up precious CPU cycles in the browser "
          , D.i__ "and"
          , text
              " you'll weed out errors earlier. If the HTML isn't valid, your program won't compile."
          ]
      , D.p_
          [ text
              "Let's see a concrete example of this. Say I try to compile the following Deku program with malformed HTML."
          ]
      , psCode
          """main :: Effect Unit
main = runInBody ((Proxy :: Proxy
    "<h1><span>hi<span></h1>") ~~ {})"""
      , D.p_ [ text "The compiler complains with the following message." ]
      , shSessionCode
          """  Could not match type

    "h1"

  with type

    "span"
"""
      , D.p_
          [ text
              "While the message could be better by identifying line numbers (we're working on this...), it identifies the HTML tag mismatch that needs to be corrected. Once we correct it, the program compiles!"
          ]
      ]
  }
