module Pages.FRP.Filtering where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D
import Pages.FRP.Filtering.Compact (compact)
import Pages.FRP.Filtering.Filter (filter)
import Router.ADT (Route(..))

filtering :: Page
filtering = page
  { route: Filtering
  , topmatter: pure
      [ D.p [D.Class := "lead"]
          [ text "How to make events less eventful."
          ]
      , D.p_
          [ text
              "If you're implementing any sort of client-side search bar or content-picker, filtering is a must. This section will show you how to filter events."
          ]
      ]
  , sections:
      [ filter, compact {-, partition-} ]
  }
