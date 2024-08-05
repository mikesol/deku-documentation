module Pages.AdvancedUsage.BuildingAndDeploying where

import Prelude

import Contracts (Page, page)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Pages.AdvancedUsage.BuildingAndDeploying.ComplexApps (complexApps)
import Pages.AdvancedUsage.BuildingAndDeploying.SimpleApps (simpleApps)
import Router.ADT (Route(..))

buildingAndDeploying :: Page
buildingAndDeploying = page
  { route: BuildingAndDeploying
  , topmatter: pure
      [ D.p [ DA.klass_ "lead" ]
          [ text_ "Deku for fun and profit (but mostly profit)"
          ]
      , D.p__
          "One way to make money with Deku is to ask all your developer friends to send you a dollar in the mail when they use Deku. They, they can recruit their friends, who will send them a dollar and send you a nominal commission. And so forth and so on."
      , D.p__
          "Another way is building and deploying apps. This section focuses on the latter."
      ]
  , sections:
      [ simpleApps, complexApps ]
  }
