module Pages.FRP.Applicatives.MonadsAndFlattening.TheKeepLatestFunction where

import Prelude

import Components.Code (psCode)
import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

theKeepLatestFunction :: Subsection
theKeepLatestFunction = subsection
  { title: "The keepLatest function"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.TheKeepLatestFunction

      pure [ D.p_
          [ text "One candidate for a "
          , D.code__ "Monad"
          , text " instance of "
          , D.code__ "Event"
          , text " is "
          , D.code__ "keepLatest"
          , text "."
          ]
      , psCode "keepLatest :: forall a. Event (Event a) -> Event a"
      , D.p_
          [ text "You can see that its signature is the same as that of "
          , targetedLink
              "https://pursuit.purescript.org/packages/purescript-prelude/6.0.1/docs/Control.Bind#v:join"
              [ D.code__ "join" ]
          , text ", so it's a promising candidate for a monad's "
          , D.code__ "bind"
          , text " function, as "
          , D.code__ "bind"
          , text " can always be derived from "
          , D.code__ "join"
          , text "."
          ]
      , D.p_
          [ D.code__ "keepLatest"
          , text
              " keeps the latest inner event stream omitted by the outer stream. To see an example of this, let's nest two intervals and use a "
          , D.code__ "fold"
          , text
              " to distinguish between events. Again, we haven't defined "
          , D.code__ "fold"
          , text
              " yet because we don't have enough tools and terms to, but you may already be able to guess what it does from its usage on this page!"
          ]
      , example
      , D.p_
          [ text "The result is a "
          , targetedLink "https://en.wikipedia.org/wiki/Tresillo_(rhythm)"
              [ text "tresillo" ]
          , text " rhythm reminiscent of great tunes like Jelly Roll Morton's "
          , targetedLink "https://www.youtube.com/watch?v=k24fD36Zurk"
              [ text "New Orleans Blues" ]
          , text " and Roger and Heart's "
          , targetedLink "https://youtu.be/IxJlcVYBvOY?t=13"
              [ text "Johnny One Note" ]
          , text ". This is due to the fact that we keep the "
          , D.i__ "latest"
          , text
              " inner event emitted by the outer event, cancelling the previous inner event. And because the inner event emits every 600 ms, when it resets at 1600 ms, it is cut off 400 ms into the event, creating 600 + 600 + 400, or 3+3+2, or tresillo."
          ]
      ]
  }
