module Pages.CoreConcepts.Effects where

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.Callbacks (callbacks)
import Pages.CoreConcepts.Effects.Hydration (hydration)
import Pages.CoreConcepts.Effects.Riders (riders)
import Router.ADT (Route(..))

effects :: forall lock payload. Page lock payload
effects = page
  { route: Effects
  , topmatter:
      [ D.p (D.Class !:= "lead")
          [ text_ "This page will be about "
          , D.span (D.Class !:= "font-bold") [ text_ "Effects" ]
          , text_ "."
          ]
      , D.p_
          [ text_
              "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
          ]
      ]
  , sections:
      [ callbacks, riders, hydration ]
  }
