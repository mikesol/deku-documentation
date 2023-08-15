module Pages.CoreConcepts.MoreHooks.CustomHooks.TheAnatomyOfAHook where

import Prelude

import Assets (cruiseURL, nicholsonURL)
import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Control (text, text_)
import Deku.Core (Hook)
import Deku.DOM as D
import Deku.Do as Deku
import Examples as Examples

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-pink-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-pink-700 focus:outline-none focus:ring-2
focus:ring-pink-500 focus:ring-offset-2 m-2""" :: String

theAnatomyOfAHook :: Subsection
theAnatomyOfAHook = subsection
  { title: "Hooked on hooks"
  , matter: pure
      [ D.p_
          [ text
              "The first step on your journey to a custom hook is saying to yourself \"I need a custom hook.\" Now that you've gotten that out of the way, Deku provides a type "
          , D.code__ "Hook a"
          , text_ " that allows you to construct a hook of type "
          , D.code__ "a"
          , text_ ". In its simplest form, it looks like this:"
          ]
      , psCodeWithLink Examples.CustomHook1
      , exampleBlockquote
          [ Deku.do
              let
                myFortyTwoHook :: Hook String
                myFortyTwoHook makeHook = makeHook "forty-two"
              fortyTwo <- myFortyTwoHook
              D.div_
                [ text fortyTwo ]
          ]
      , D.p_
          [ text_ "Note that the "
          , D.code__ "Hook"
          , text
              " type constructor is actually a function that takes the hook creator as an argument and returns whatever is in your hook passed through that creator. The flow may seem a bit odd at first, but you'll get the hang of it! Just remember: to make a hook, make sure to accept a "
          , D.i__ "function"
          , text
              " as the first parameter and, as the last step, apply that function to the content of your hook. In the example above, we call the function "
          , D.code__ "makeHook"
          , text
              ", but it could just as well be called "
          , D.code__ "cruise"
          , text
              " or "
          , D.code__ "nicholson"
          , text
              "."
          ]
      , psCodeWithLink Examples.CustomHook2
      , exampleBlockquote
          [ Deku.do
              let
                hook1 :: Hook Boolean
                hook1 cruise = cruise true

                hook2 :: Hook Boolean
                hook2 nicholson = nicholson true
              r1 <- hook1
              r2 <- hook2
              D.div_
                [ D.p_ [ text_ "I want the ", D.code__ $ show r1, text_ "th!" ]
                , D.img [D.Src := cruiseURL] []
                , D.p_
                    [ text_ "You can't handle the "
                    , D.code__ $ show r2
                    , text_ "th!"
                    ]
                , D.img [D.Src := nicholsonURL] []
                ]
          ]
      ]
  }
