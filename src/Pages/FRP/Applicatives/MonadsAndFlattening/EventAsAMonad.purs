module Pages.FRP.Applicatives.MonadsAndFlattening.EventAsAMonad where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

eventAsAMonad :: Subsection
eventAsAMonad = subsection
  { title: "Event as a monad"
  , matter: pure
      [ D.p_
          [ text_ "So naturally, we are led to ask if "
          , D.code__ "keepLatest"
          , text_ " is a viable candidate to usher "
          , D.code__ "Event"
          , text_ " into the pantheon of monad-ness? Our definition "
          , D.code__ "bind"
          , text_ " would be "
          , D.code__ "bind m f = keepLatest (f <$> m)"
          , text_
              ". Armed with this definition, we would need to verify that it fulfills the monad laws."
          ]
      , D.ul_
          [ D.li_
              [ D.b__ "Left Identity"
              , text_ ": "
              , D.code__ "pure x >>= f = f x"
              ]
          , D.li_
              [ D.b__ "Right Identity"
              , text_ ": "
              , D.code__ "x >>= pure = x"
              ]
          , D.li_
              [ D.b__ "Associativity"
              , text_ ": "
              , D.code__ "(x >>= f) >>= g = x >>= (\\k -> f k >>= g)"
              ]
          ]
      , D.p_
          [ text_
              "While identity holds, associativity does not. This is because, on the left side, "

          , D.code__ "x"
          , D.i__ " distributes "
          , text_ " to "
          , D.code__ "f"
          , text_ " and "
          , D.code__ "g"
          , text_ " whereas on the right side it "
          , D.i__ " adds "
          , text_ " to "
          , D.code__ "f"
          , text_ " which then adds to "
          , D.code__ "g"
          , text_
              ". The result is that the left side would have more events because "
          , D.code__ " f "
          , text_ " and "
          , D.code__ "g"
          , text_
              " would both be contributing impulses, whereas on the right side, only "
          , D.code__ "g"
          , text_ " is contributing impulses."
          ]
      , D.p_
          [ text_
              "The only viable monad definition would be one that doesn't have restarting - namely, one where each new outer event triggers an inner event but doesn't clean up the old one. This is often called "
          , D.code__ "flatMap"
          , text_ " in FRP frameworks. So, at least in theory, "
          , D.code__ "Event"
          , text_ " "
          , D.i__ "can"
          , text_
              " be a monad. But, by convention, it's not. This is a deliberate choice of several frameworks, including "
          , D.code__ "purescript-hyrule"
          , text_
              ", to make it hard for people to accidentally create situations where, after lots of binds, 1000s of events are spewing every second because the previous ones haven't been cleaned up."
          ]
      , D.p_
          [ text_ "So there's your answer - "
          , D.code__ "Event"
          , text_
              " is not a monad for your own safety. We may change our minds about this in the future, but so far, no one seems to miss "
          , D.code__ "flatMap"
          , text_
              ", so the benefits of adding it don't seem to offset the cost of someone accidentally frying their CPU."
          ]
      ]
  }
