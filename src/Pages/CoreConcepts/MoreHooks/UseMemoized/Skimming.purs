module Pages.CoreConcepts.MoreHooks.UseMemoized.Skimming where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

skimming :: Subsection
skimming = subsection
  { title: "The useSkimmed hook"
  , matter: pure
      [ D.p_
          [ text_
              "Lastly, for you performance nerds, "
          , D.code__ "useSkimmed"
          , text_
              " is like "
          , D.code__ "useRant"
          , text_
              " except that it emits the final initial event if one is present. This may seem a bit counterintuitive, as the point of "
          , D.code__ "useRant"
          , text_
              " is to memoize the dynamic bits and lob off initial pure values so that there isn't a burst of activity on subscription. However, there are times when you want to avoid the flurry of initial activity "
          , D.i__ "except"
          , text_
              " the last initial event, which one can then choose to use or discard. The "
          , D.code__ "useSkimmed"
          , text_ " hook skims off all but the last initial event."

          ]
      ]
  }
