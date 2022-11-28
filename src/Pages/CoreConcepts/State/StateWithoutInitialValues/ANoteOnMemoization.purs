module Pages.CoreConcepts.State.StateWithoutInitialValues.ANoteOnMemoization where

import Contracts (Env(..), Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

aNoteOnMemoization :: forall lock payload. Subsection lock payload
aNoteOnMemoization = subsection
  { title: "A note on memoization"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "It's important to know that the hooks above are "
          , D.i__ "not"
          , text_
              " memoized, meaning that they do not store their most recent value. They simply pass through whatever comes down the pipe. This can lead to gotchyas if you're not careful. In the snippet below, for example, press button "
          , D.b__ "A"
          , text_ " a few times before pressing button "
          , D.b__ "B"
          , text_ ". What do you think will happen?"
          ]
      , D.p_
          [ text_
              "It is indeed possible to have hooks that always supply their most recent value, but it comes with a slight performance penalty. We'll see how this works in the "
          , routeLink MoreHooks
          , text_
              " section. Note that the performance penalty is negligible for most real-world applciations. You won't feel any in the example below, which is a memoized version of the example above. If you absolutely must learn how to implement it "
          , D.i__ "now"
          , text_ ", you can click "
          , D.b__ "Reveal code"
          , text_ "."
          ]
      ]
  }
