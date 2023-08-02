module Pages.AdvancedUsage.CustomElements.UsingIonic where

import Prelude

import Components.TargetedLink (targetedLink)
import Contracts (Section, section)
import Deku.Control (text)
import Deku.DOM as D
import Pages.AdvancedUsage.CustomElements.UsingIonic.DefiningIonicCustomElements (definingIonicCustomElements)
import Pages.AdvancedUsage.CustomElements.UsingIonic.UsingIonicCustomElements (usingIonicCustomElements)

usingIonic :: Section
usingIonic = section
  { title: "An example using fake Discord messages"
  , topmatter: pure
      [ D.p_
          [ text
              "You can also use this method to work with components created by libraries like "
          , targetedLink "https://stenciljs.com/" [ text "Stencil.js" ]
          , text ". In this section, we'll bring stencil components from "
          , targetedLink "https://github.com/Danktuary/wc-discord-message"
              [ D.code__ "wc-discord-message" ]
          , text " into Deku."
          ]
      ]
  , subsections:
      [ definingIonicCustomElements, usingIonicCustomElements ]
  }
