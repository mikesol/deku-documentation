module Pages.FRP.Alternatives.Plus where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.FRP.Alternatives.Plus.LawfullyAlternative (lawfullyAlternative)
import Pages.FRP.Alternatives.Plus.Emptiness (emptiness)

plus :: Section
plus = section
  { title: "Plus"
  , topmatter: pure
      [ D.p_
          [ text_ "The "
          , D.code__ "Plus"
          , text_
              " typeclass allows us to define an empty element for a collection. We've already sort-of seen this, as we need an empty element for "
          , D.code__ "oneOf"
          , text_
              " to work on an empty array. Let's build some intuition about what the empty "
          , D.code__ "Event"
          , text_ " is and how it is lawful."
          ]
      ]
  , subsections:
      [ emptiness, lawfullyAlternative ]
  }
