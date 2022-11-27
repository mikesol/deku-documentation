module Pages.Introduction.GettingStarted.GettingHelp.JoinTheCommunity where

import Contracts (Subsection, subsection)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

joinTheCommunity :: forall lock payload. Subsection lock payload
joinTheCommunity = subsection
  { title: "Join the community"
  , matter:
      [ D.p_
          [ text_
              "Deku has a small but passionate community of framework users and developers that hang out on the "
          , D.a (D.Href !:= "https://discord.gg/Tvt9uBpv5s") [ text_ "FRP" ]
          , text_
              " channel of the PureScript Discord. No question is too small, no Zelda-themed meme is too tangential. Come say hi!"
          ]
      ]
  }