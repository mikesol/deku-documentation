module Pages.CoreConcepts.Pursx.PursxAlternatives.UnsafePursx where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Examples as Examples
import Type.Proxy (Proxy(..))

unsafePursx :: Subsection
unsafePursx = subsection
  { title: "Unsafe Pursx"
  , matter: pure
      [ D.p_
          [ text
              "While Pursx provides helpful type-safety, it may be too restrictive for several reasons."
          ]
      , D.ul_
          [ D.li__
              "Your HTML follows conventions outside of the ones the parser understands."
          , D.li__
              "The example is too long and thus takes a long time to compile."
          ]
      , D.p_
          [ text_ "In both of these cases, you can use ⚠️"
          , D.b__ "unsafe Pursx"
          , text
              "⚠️. Unsafe pursx works just like pursx except it operates off of strings rather than proxies. The syntax uses "
          , D.code__ "~!~"
          , text_ " instead of "
          , D.code__ "~~"
          , text
              ", but the functionality is exactly the same. Note that there's no validation of unsafe Pursx, which means that your app may explode, so make sure to run your html through a validator first!"
          ]
      , D.p__ "Here's an example of unsafe pursx."
      , psCodeWithLink Examples.UnsafePursx
      , D.p__ "And here's how it looks."
      , exampleBlockquote [ ((Proxy :: _ "<h4>(un)safe!</h4>") ~~ {}) ]
      , D.p__
          "Phew, that was a close call. In spite of flaunting the rules of type safety, our HTML is well-formed and the DOM is safe from unclosed tags and misplaced quotation marks!"
      ]
  }
