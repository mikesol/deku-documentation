module Pages.CoreConcepts.MoreHooks.CustomHooks.TheAnatomyOfAHook where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
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
  , matter: do
      example <- getExample StartExpanded Nothing
        Examples.CustomHook1
      example2 <- getExample StartExpanded Nothing
        Examples.CustomHook2

      pure
        [ D.p_
            [ text_
                "The first step on your journey to a custom hook is saying to yourself “I need a custom hook.” Now that you've gotten that out of the way, Deku provides a type "
            , D.code__ "Hook a"
            , text_ " that allows you to construct a hook of type "
            , D.code__ "a"
            , text_ ". In its simplest form, it looks like this:"
            ]
        , example
        , D.p_
            [ text_ "Note that the "
            , D.code__ "Hook"
            , text_
                " type constructor is actually a function that takes the hook creator as an argument and returns whatever is in your hook passed through that creator. The flow may seem a bit odd at first, but you’ll get the hang of it! Just remember: to make a hook, make sure to accept a "
            , D.i__ "function"
            , text_
                " as the first parameter and, as the last step, apply that function to the content of your hook. In the example above, we call the function "
            , D.code__ "makeHook"
            , text_
                ", but it could just as well be called "
            , D.code__ "cruise"
            , text_
                " or "
            , D.code__ "nicholson"
            , text_
                "."
            ]
        , example2
        ]
  }
