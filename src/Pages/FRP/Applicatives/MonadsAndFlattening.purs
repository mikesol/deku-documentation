module Pages.FRP.Applicatives.MonadsAndFlattening where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.FRP.Applicatives.MonadsAndFlattening.TheKeepLatestFunction (theKeepLatestFunction)
import Pages.FRP.Applicatives.MonadsAndFlattening.EventAsAMonad (eventAsAMonad)

monadsAndFlattening :: Section
monadsAndFlattening = section
  { title: "Monads and flattening"
  , topmatter: pure
      [ D.p_
          [ text_ "By now, the suspense must be killing you. Is "
          , D.code__ "Event"
          , text_
              " a monad? Is it not a monad? The answer is \"maybe\". Or even better, the answer is \"what do you think?\" Read on for a bit of information before you form an opinion!"
          ]
      ]
  , subsections:
      [ theKeepLatestFunction, eventAsAMonad ]
  }
