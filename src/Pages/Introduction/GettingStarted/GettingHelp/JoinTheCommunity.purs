module Pages.Introduction.GettingStarted.GettingHelp.JoinTheCommunity where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D

joinTheCommunity :: Subsection
joinTheCommunity = subsection
  { title: "Join the community"
  , matter: pure
      [ D.p_
          [ text
              "Deku has a small but passionate community of framework users and developers that hang out on the "
          , D.a [ D.Href := "https://discord.gg/Tvt9uBpv5s" ] [ text "FRP" ]
          , text
              " channel of the PureScript Discord. No question is too small, no Zelda-themed meme is too tangential. Come say hi!"
          ]
      ]
  }