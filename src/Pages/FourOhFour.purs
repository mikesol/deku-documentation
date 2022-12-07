module Pages.FourOhFour where

import Contracts (Env(..), Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

fourOhFour :: forall lock payload. Page lock payload
fourOhFour = page
  { route: FourOhFour
  , topmatter: \(Env { routeLinkWithText }) ->
      [ D.p_
          [ text_
              "This is the secret part of the documentation reserved for our exclusive Diamond Club Members. If you are a Diamond Club Member, you know the combination of clicks, swipes, and computer shakes needed to unlock the content on this page. Otherwise, if you are not a Diamond Club Member, you've stolen this link from someone who is. Shame on you. Here's the "
          , routeLinkWithText GettingStarted "🚪"
          , text_ ", don't let it hit you on the way out!"
          ]
      ]
  , sections:
      [
      ]
  }
