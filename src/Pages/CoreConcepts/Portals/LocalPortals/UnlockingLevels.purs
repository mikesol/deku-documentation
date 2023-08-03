module Pages.CoreConcepts.Portals.LocalPortals.UnlockingLevels where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

unlockingLevels :: Subsection
unlockingLevels = subsection
  { title: "Unlocking levels"
  , matter: do
      example <- getExample StartExapanded Nothing Examples.UnlockingLevels
      pure [ D.p_
          [ text
              "Local portals have one big advantage over global portals: they get cleaned up when the last reference to them is deleted. Because global portals can be used "
          , D.i__ "anywhere"
          , text
              " in your application at any time, it's impossible to know when they can be safely deleted. Local portals, on the other hand, are tied to the scope in which they are created and cannot be used at a higher scope. If you try, for example by sending them to a hook, you'll get a type error."
          ]

      , D.p_
          [ text
              "Of course, there's no such thing as a free lunch, so you have to pay for this memory efficiency somehow. Where you pay is a slightly slower runtime API in theory. In practice, the slowdown is imperceptible."
          ]
      , D.p_
          [ text
              "In the code below, note how we use this mechanism to call "
          , D.code__ "lowerVid"
          , text
              " when we want to use the video "
          , D.code__ "globalVid"
          , text " from the higher scope inside of the lower scope."
          ]
      , D.p__
          "In the example below, make sure to try all the controls. Send the top video down, bring the video back up again, shuffle the inner videos, etc. While you can't see it, know that every time you click shuffle video, the inner video object's memory is released when it is replaced."
      , example
      ]
  }
