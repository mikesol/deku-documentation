module Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations where

import Prelude

import Contracts (Section, section)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations.GlobalHandlers (globalHandlers)
import Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations.Routing (routing)

toplevelConsiderations :: forall lock payload. Section lock payload
toplevelConsiderations = section
  { title: "Top-level considerations"
  , topmatter: pure
      [ D.p_
          [ text_ "Every game or app in the wild uses some sort of global tear down and set up, often having to do with authenticating users, confirming hardware, adding third-party widgets, and setting up global app state like routing. In these cases, you'll need to do a bunch of stuff before invoking ", D.code__ "runInBody", text_ ". There's no special trick to how to organize this code, but we'll present a couple examples below just to give you a sense of how these things could be done."
          ]
      ]
  , subsections:
      [ globalHandlers, routing ]
  }
