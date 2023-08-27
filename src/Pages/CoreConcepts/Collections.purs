module Pages.CoreConcepts.Collections where

import Prelude

import Contracts (Page, page)
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Collections.DynamicElements (dynamicElements)
import Pages.CoreConcepts.Collections.FixedElements (fixedElements)
import Pages.CoreConcepts.Collections.Monoids (monoids)
import Router.ADT (Route(..))

collections :: Page
collections = page
  { route: Collections
  , topmatter: pure
      [ D.p [ DA.klass_ "lead" ]
          [ text_ "Working with lists and dynamic elements."
          ]
      , D.p_
          [ text_
              "So far, all of the examples we've seen with the exception of "
          , D.code__ "<#~>"
          , text_ " work with the DOM as a static entity. The "
          , D.code__ "<#~>"
          , text_
              " operator is sufficient for many use cases where you want to refresh content, however, it can be heavy for long lists. For example, if a single avatar in a single profile in a collection of 100 profiles updates, or if you need to insert a new profile card in a large collection, you don't want to re-render the whole DOM. This page will present efficient methods for managing these scenarios."
          ]
      ]
  , sections:
      [ fixedElements, monoids, dynamicElements ]
  }
