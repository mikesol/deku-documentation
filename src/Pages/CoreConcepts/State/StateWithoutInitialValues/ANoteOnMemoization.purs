module Pages.CoreConcepts.State.StateWithoutInitialValues.ANoteOnMemoization where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Data.String (replaceAll, Pattern(..), Replacement(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

-- bg-fuchsia-600
-- hover:bg-fuchsia-700 
-- focus:ring-fuchsia-500
buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mr-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

aNoteOnMemoization :: Subsection
aNoteOnMemoization = subsection
  { title: "Memoization and useHot"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.ANoteOnMemoization
      example2 <- getExample StartCollapsed Nothing
        Examples.AWayToMemoize
      pure
       [ D.p_
          [ text_ "It's important to know that the hooks above are "
          , D.i__ "not"
          , text
              " memoized, meaning that they do not store their most recent value. They simply pass through whatever comes down the pipe. This comes from Deku's tradition as an engine for games and interactive art, where events are often streams of data. However, in certain cases, like when an event holds a user profile, you always want to use the most recent value."
          ]
      , D.p_
          [ text
              "To see this in practice, in the snippet below, press button "
          , D.b__ "A"
          , text_ " a few times and then press "
          , D.b__ "B"
          , text_ " "
          , D.i__ "once and only once"
          , text_ " (even if you don't think it's responding). Then press "
          , D.b__ "A"
          , text_ " again a few times. What do you think will happen?"
          ]
      , example
      , D.p_
          [ text
              "Because the hook simply passes through values as it receives them, as there was no simultaneous value coming from "
          , D.b__ "A"
          , text
              " when "
          , D.b__ "B"
          , text_ " was pressed, the guarded section didn't activate until "
          , D.b__ "A"
          , text
              " was pressed again. In effect, while the hook had an initial value "
          , D.code__ "n"
          , text_ " for the first "
          , D.code__ "text"
          , text
              "component, it lacked an initial value for any component that was created afterwards. You can think of initial values to hooks as being relevant only at the moment of creation."
          ]
      , D.p_
          [ text
              "It is indeed possible to have hooks that always supply their most recent value, but it requires using a concept we haven't learned about yet: the "
          , D.code__ "Poll"
          , text_ ". Fear not though, an example will thusly be presented, and we'll cover "
          , D.code__ "Poll"
          , text_ "s later."
          ]
      ,example2
      ]
  }
