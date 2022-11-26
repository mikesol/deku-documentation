module Pages.Introduction.GettingStarted where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.Introduction.GettingStarted.BasicUsage (basicUsage)
import Pages.Introduction.GettingStarted.GettingHelp (gettingHelp)
import Pages.Introduction.GettingStarted.QuickStart (quickStart)
import Router.ADT (Route(..))

gettingStarted :: forall lock payload. Page lock payload
gettingStarted = page
  { route:  GettingStarted
  , topmatter:
          [ D.p (D.Class !:= "lead")
              [ text_ "This page will be about "
                , D.span (D.Class !:= "font-bold") [ text_ "GettingStarted"]
                , text_ "."
              ]
          , D.p_
              [ text_
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis maximus tortor, nec egestas lectus. Aliquam faucibus convallis arcu in dignissim. Integer lacus ex, aliquet vel varius et, suscipit nec felis. Curabitur justo nibh, pretium at placerat eu, tincidunt et sapien. Nullam ullamcorper accumsan dolor, eu efficitur lectus finibus ac. Phasellus et lectus vitae lectus euismod fermentum. Praesent vel ullamcorper mi. Donec efficitur molestie aliquam. Phasellus ultricies ac ipsum ut elementum. Etiam hendrerit hendrerit sapien, rhoncus pulvinar sem molestie ac. Fusce ullamcorper vulputate nulla at laoreet. Vivamus elementum orci nulla, eu fermentum erat vulputate ac. In convallis enim vitae sapien malesuada, nec congue velit porta. Sed accumsan nisl quis facilisis fermentum. Sed malesuada nibh quis quam lobortis interdum."
              ]
          ]
  , sections:
      [ quickStart,gettingHelp,basicUsage]
  }
