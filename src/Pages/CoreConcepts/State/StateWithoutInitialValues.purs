module Pages.CoreConcepts.State.StateWithoutInitialValues where

import Prelude

import Contracts (Section, section)
import Deku.Control (text, text_)
import Deku.DOM as D
import Pages.CoreConcepts.State.StateWithoutInitialValues.EmptyUntilFull (emptyUntilFull)
import Pages.CoreConcepts.State.StateWithoutInitialValues.ANoteOnMemoization (aNoteOnMemoization)

stateWithoutInitialValues :: Section
stateWithoutInitialValues = section
  { title: "State without initial values"
  , topmatter: pure
      [ D.p_
          [ text_
              "It's possible to have a state hook without an initial value. In that case, whatever the hook was controlling, be it text, an attribute, or an element, is simply omitted from the DOM."
          ]
      ]
  , subsections:
      [ emptyUntilFull, aNoteOnMemoization ]
  }
