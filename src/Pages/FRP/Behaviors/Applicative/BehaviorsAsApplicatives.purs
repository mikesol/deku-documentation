module Pages.FRP.Polls.Applicative.PollsAsApplicatives where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

pollsAsApplicatives :: Subsection
pollsAsApplicatives = subsection
  { title: "Polls as applicatives"
  , matter: pure
      [ D.p_
          [ text_ "Because polls embody a measurement "
          , D.i__ " and "
          , text_
              " the potential duration of the measurement as well as the number of times the measurement occurs, the "
          , D.code__ "Apply"
          , text_
              " instance of poll needs to accumulate any additional effects added by the two incoming polls. In this way, it is similar to the "
          , D.code__ "Apply"
          , text_ " instance of "
          , D.code__ "Event"
          , text_ "."
          ]
      , D.p_
          [ text_ "A question then arises: is "
          , D.code__ "Poll"
          , text_ "'s "
          , D.code__ "Apply"
          , text_ " instance additive or multiplicative? That is, does the "
          , D.code__ "Apply"
          , text_ " instance of "
          , D.code__ "Poll"
          , text_ " accumulate effects?"
          ]
      , psCode
          """apply (Poll f) (Poll a) =
  Poll \e -> (map (\ff (Tuple bc aaa) -> bc (ff aaa)) (f (e $> identity))) <*> a (map Tuple e)
"""
      , D.p_ [ text_ " Or does it combine them?" ]

      , psCode
          """apply (Poll f) (Poll a) =
            Poll \e -> a (f (compose <$> e))"""
      , D.p_
          [ text_
              "Both are valid, but in practice, the additive instance is more useful. This is because we want to think of the two "
          , D.code__ "Poll"
          , text_ "s on either side of the applicative as independent. Other "
          , D.code__ "Applicative"
          , text_ "s like "
          , D.code__ "Fiber"
          , text_ " and "
          , D.code__ "Event"
          , text_ " follow the same philosophy."
          ]
      ]
  }
