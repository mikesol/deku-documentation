module Pages.FRP.Events.PureEvents.TheSTMonad where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Attributes (href)
import Deku.Control (text)
import Deku.DOM as D

theSTMonad :: Subsection
theSTMonad = subsection
  { title: "The ST r monad"
  , matter: pure
      [ D.p_
          [ text "The "
          , D.code__ "ST r"
          , text " monad, affectionately nicknamed the "
          , D.code__ "ST"
          , text
              " monad, is a monad in which arbitrary stateful variables can be created, read, and written. Other than that effect, it is completely pure. And because the reference-based system can't trigger any additional side-effects, it is "
          , D.a
              [ href
                  "https://www.oreilly.com/library/view/functional-programming-a/9781680502756/f_0017.xhtml"
              ]
              [ text "pure in the functional-programming sense of pure" ]
          , text "."
          ]
      , D.p_
          [ text "The main two in the "
          , D.code__ "ST r"
          , text " monad are:"
          ]
      , D.ol_
          [ D.li_
              [ D.code__ "new"
              , text
                  ", which creates a new reference to an arbitrary term; and "
              ]
          , D.li_
              [ D.code__ "modify"
              , text
                  ", which modifies the term stored in the reference, returning the new term."
              ]
          ]
      , D.p_
          [ text "Utility functions like "
          , D.code__ "write"
          , text " and "
          , D.code__ "read"
          , text " can be created from "
          , D.code__ "modify"
          , text "."
          ]
      , D.p_
          [ text
              "When working with events, it is often useful to create references to terms in order to use them later. For example, one way to implement a "
          , D.code__ "dedup"
          , text
              " function is to store a reference to a previous value, compare it to a new value, and only emit the new value if it is different than the old value. In these cases, the "
          , D.code__ "ST r"
          , text
              " monad gives us everything we need and nothing extra to implement a stateful-yet-pure system."
          ]
      ]
  }
