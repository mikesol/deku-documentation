module Pages.FRP.Filtering.Compact.WhyEventsCannotWither where

import Prelude

import Components.Code (psCode)
import Components.TargetedLink (targetedLink)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

whyEventsCannotWither :: Subsection
whyEventsCannotWither = subsection
  { title: "Why events cannot wither"
  , matter: pure
      [ D.p_
          [ text_ "The "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-filterable/docs/Data.Witherable#t:Witherable"
              [ D.code__ "Witherable" ]
          , text
              " typeclass from PureScript's filterable package is an amazing class that allows you to accumulate an arbitrary effect every time something is partitioned."
          ]
      , psCode
          """class (Filterable t, Traversable t) <= Witherable t where
  wilt :: forall m a l r. Applicative m =>
    (a -> m (Either l r)) -> t a -> m { left :: t l, right :: t r }

  wither :: forall m a b. Applicative m =>
    (a -> m (Maybe b)) -> t a -> m (t b)"""
      , D.p_
          [ text
              "This is very useful for doing things like logging when performing a partition. Types that are Filterable, Compactable, and Witherable achieve the holy trifecta of filtering, which confers unto them a special glow that makes them more pleasant to work with. Unfortunately, for events, this simply isn't possible 😞"
          ]
      , D.p_
          [ text
              "There is no way to take an effect applied to each event emission and hoist it to a higher context. If that were the case, we would need to time travel to all future events, retrieve their effects, time travel back, and incorporate them into the enclosing applicative. While the PureScript core team is ardently working on time travel as a stepping stone to dependent types, they haven't figured it out yet, so events cannot wither. But do not let this deter you from using them!"
          ]
      ]
  }
