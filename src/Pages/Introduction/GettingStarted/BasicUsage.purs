module Pages.Introduction.GettingStarted.BasicUsage where

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.Introduction.GettingStarted.BasicUsage.RunningADevServer (runningADevServer)
import Pages.Introduction.GettingStarted.BasicUsage.BuildingForProduction (buildingForProduction)

basicUsage :: forall lock payload. Section lock payload
basicUsage = section
  { title: "BasicUsage"
  , topmatter:
      [ D.p_
          [ text_ "This section will be about "
            , D.span (D.Class !:= "font-bold") [ text_ "BasicUsage"]
            , text_ "."
          ]
      ]
  , subsections:
      [ runningADevServer,buildingForProduction]
  }
