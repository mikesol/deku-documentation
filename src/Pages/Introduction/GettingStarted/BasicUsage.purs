module Pages.Introduction.GettingStarted.BasicUsage where

import Prelude

import Contracts (Section, section)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Pages.Introduction.GettingStarted.BasicUsage.RunningADevServer (runningADevServer)
import Pages.Introduction.GettingStarted.BasicUsage.BuildingForProduction (buildingForProduction)

basicUsage :: Section
basicUsage = section
  { title: "Basic usage"
  , topmatter: pure
      [ D.p_
          [ text_ "This section will be about "
          , D.span [D.Class !:= "font-bold"] [ text_ "Basic usage" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis maximus tortor, nec egestas lectus. Aliquam faucibus convallis arcu in dignissim. Integer lacus ex, aliquet vel varius et, suscipit nec felis. Curabitur justo nibh, pretium at placerat eu, tincidunt et sapien. Nullam ullamcorper accumsan dolor, eu efficitur lectus finibus ac. Phasellus et lectus vitae lectus euismod fermentum. Praesent vel ullamcorper mi. Donec efficitur molestie aliquam. Phasellus ultricies ac ipsum ut elementum. Etiam hendrerit hendrerit sapien, rhoncus pulvinar sem molestie ac. Fusce ullamcorper vulputate nulla at laoreet. Vivamus elementum orci nulla, eu fermentum erat vulputate ac. In convallis enim vitae sapien malesuada, nec congue velit porta. Sed accumsan nisl quis facilisis fermentum. Sed malesuada nibh quis quam lobortis interdum."
          ]
      ]
  , subsections:
      [ runningADevServer, buildingForProduction ]
  }
