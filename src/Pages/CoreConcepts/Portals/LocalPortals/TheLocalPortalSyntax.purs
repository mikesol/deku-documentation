module Pages.CoreConcepts.Portals.LocalPortals.TheLocalPortalSyntax where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples


theLocalPortalSyntax :: Subsection
theLocalPortalSyntax = subsection
  { title: "The local portal syntax"
  , matter:  do
      example <- getExample StartExapanded Nothing Examples.TheLocalPortalSyntax
      pure [ D.p_
          [ text
              "Local portals look just like global portals."
          ]
      , D.p__ "This yields a similar result as the one above."
      , example
      , D.p_
          [ text
              "The difference between local and global portals is that you get better performance from local portals with slightly less predictable runtime behavior. To understand why it's more performant, we'll use a slightly more involved example in the next section."
          ]
      ]
  }
