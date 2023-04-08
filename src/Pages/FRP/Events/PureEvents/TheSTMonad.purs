module Pages.FRP.Events.PureEvents.TheSTMonad where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Attributes (href_)
import Deku.Control (text_)
import Deku.DOM as D

theSTMonad :: Subsection
theSTMonad = subsection
  { title: "The ST r monad"
  , matter: pure
      [ D.p_
          [ text_ "The "
          , D.code__ "ST r"
          , text_ " monad, affectionately nicknamed the "
          , D.code__ "ST"
          , text_
              " monad, is a monad in which arbitrary stateful variables can be created, read, and written. Other than that effect, it is completely pure. And because the reference-based system can't trigger any additional side-effects, it is "
          , D.a
              [ href_
                  "https://www.oreilly.com/library/view/functional-programming-a/9781680502756/f_0017.xhtml"
              ]
              [ text_ "pure in the functional-programming sense of pure" ]
          , text_ "."
          ]
      , D.p_
          [ text_ "The main two in the "
          , D.code__ "ST r"
          , text_ " monad are:"
          ]
      , D.ol_
          [ D.li_
              [ D.code__ "new"
              , text_
                  ", which creates a new reference to an arbitrary term; and "
              ]
          , D.li_
              [ D.code__ "modify"
              , text_
                  ", which modifies the term stored in the reference, returning the new term."
              ]
          ]
      , D.p_
          [ text_ "Utility functions like "
          , D.code__ "write"
          , text_ " and "
          , D.code__ "read"
          , text_ " can be created from "
          , D.code__ "modify"
          , text_ "."
          ]
      , D.p_
          [ text_
              "When working with events, it is often useful to create references to terms in order to use them later. For example, one way to implement a "
          , D.code__ "dedup"
          , text_
              " function is to store a reference to a previous value, compare it to a new value, and only emit the new value if it is different than the old value. In these cases, the "
          , D.code__ "ST r"
          , text_
              " monad gives us everything we need and nothing extra to implement a stateful-yet-pure system."
          ]
      ]
  }
