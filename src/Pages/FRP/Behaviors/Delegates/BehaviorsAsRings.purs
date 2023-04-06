module Pages.FRP.Behaviors.OtherInstances.BehaviorsAsRings where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.Attribute ((!:=))
import Deku.DOM as D
import Contracts (Subsection, subsection)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Type.Proxy (Proxy(..))

behaviorsAsRings :: Subsection
behaviorsAsRings = subsection
  { title: "Behaviors as rings"
  , matter: pure
      [ ( Proxy
            :: _
                 "<p>Unlike the movie <a target=\"_blank\" href=\"https://www.imdb.com/title/tt0298130/\">The Ring</a>, a terrible fate will not befall you one week after using <code>Behavior</code>s as a <code>Ring</code>. Feel free to add, subtract, and multiply them if their underlying type is a <code>Ring</code> as well!</p>"
        ) ~~ {}
      ]
  }
