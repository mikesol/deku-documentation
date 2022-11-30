module Pages.CoreConcepts.Pursx.PursxAlternatives.UnsafePursx where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Type.Proxy (Proxy(..))

unsafePursx :: forall lock payload. Subsection lock payload
unsafePursx = subsection
    { title: "Unsafe pursx"
    , matter: pure
        [ D.p_
            [ text_ "While Pursx provides helpful type-safety, it may be too restrictive for several reasons."
            ]
        , D.ul_ [
            D.li__ "Your HTML follows conventions outside of the ones the parser understands."
            , D.li__ "The example is too long and thus takes a long time to compile."
        ], D.p_ [text_ "In both of these cases, you can use ", D.b__ "unsafe Pursx", text_ ". Unsafe pursx works just like pursx except it operates off of strings rather than proxies. The syntax uses ", D.code__ "~!~", text_ " instead of ", D.code__ "~~", text_ ", but the functionality is exactly the same. Note that there's no validation of unsafe Pursx, which means that your app may explode, so make sure to run your html through a validator first!" ]
        , D.p__ "Here's an example of unsafe pursx."
        , psCode """module Main where

import Prelude

import Deku.Do as Deku
import Deku.Pursx ((~!~))
import Deku.Toplevel (runInBody)
import Effect (Effect)


main :: Effect Unit
main = runInBody ("<h4>(un)safe!</h4>" ~!~ {})"""
        , D.p__ "And here's how it looks."
        , exampleBlockquote [((Proxy :: _ "<h4>(un)safe!</h4>") ~~ {})]
        , D.p__ "Phew, that was a close call. In spite of flaunting the rules of type safety, our HTML is well-formed and the DOM is safe from unclosed tags and misplaced quotation marks!"
        ]
    }
