module Pages.FourOhFour where

import Prelude

import Contracts (Env(..), Page, getEnv, page)
import Deku.Control (text, text_)
import Deku.DOM as D
import Router.ADT (Route(..))

fourOhFour :: Page
fourOhFour = page
  { route: FourOhFour
  , topmatter: do
      Env { routeLinkWithText } <- getEnv
      pure
        [ D.p_
            [ text
                "This is the secret part of the documentation reserved for our exclusive Diamond Club Members. If you are a Diamond Club Member, you know the combination of clicks, swipes, and computer shakes needed to unlock the content on this page. Otherwise, if you are not a Diamond Club Member, you've stolen this link from someone who is. Shame on you. Here's the "
            , routeLinkWithText GettingStarted "🚪"
            , text_ ", don't let it hit you on the way out!"
            ]
        ]
  , sections:
      [
      ]
  }
