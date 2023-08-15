module Pages.AdvancedUsage.CustomElements.UsingIonic.DefiningIonicCustomElements where

import Prelude

import Components.Code (jsCode, shSessionCode)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D

definingIonicCustomElements :: Subsection
definingIonicCustomElements = subsection
  { title: "Importing our custom elements"
  , matter: pure
      [ D.p_
          [ text_
              "Before using custom elements, make sure to import them using whatever instructions are given in the README.md of the library you're using. In the case of "
          , D.code__ "wc-discord-message"
          , text_ ", that'd be:"
          ]
      , shSessionCode """$ pnpm i wc-discord-message"""
      , D.p__ "And then:"
      , jsCode
          """import { applyPolyfills, defineCustomElements } from 'wc-discord-message/loader'

applyPolyfills().then(() => defineCustomElements(window))"""
      , D.p__
          "You can also import the package via unpkg, which is what this documentation does. It's important to note that Deku can't help you with this. To initialize your components, you'll still need to write some JavaScript or hire a consultant to."
      ]
  }
