module Pages.FRP.FixAndFold.FoldingEvents.TheFoldFunction where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D

theFoldFunction :: Subsection
theFoldFunction = subsection
  { title: "The fold function"
  , matter: pure
      [ D.p_
          [ text
              "Folding is a type of fixed point that stores an event's previous value combined with a transformation to produce a new value. The definition is:"
          ]
      , psCode
          """fold :: a b. (b -> a -> b) -> b -> Event a -> Event b
fold f b e = fix \i -> sampleOnRight (i <|> pure b) ((flip f) <$> e)"""
      , D.p_
          [ text
              "This looks similar to the lag functions we created above, but instead of creating a tuple we create an arbitrary function that combines "
          , D.code__ "b"
          , text " and "
          , D.code__ " a "
          , text " to produce a "
          , D.code__ "b"
          , text ". The type "
          , D.code__ "b"
          , text " can, of course, include an "
          , D.code__ "a"
          , text ", ie "
          , D.code__ "Maybe (Tuple Int a)"
          , text
              ". This allows you to output both a state and the value of the event."
          ]
      ]
  }
