module Pages.FRP.OtherInstances.Monoid.EventsAsSemigroups where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass, klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Examples as Examples

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

eventsAsSemigroups :: Subsection
eventsAsSemigroups = subsection
  { title: "Events as semigroups"
  , matter: pure
      [ D.p_
          [ text_
              "The example below shows two events appended together to control classes"
          ]
      , psCodeWithLink Examples.EventsAsSemigroups
      , exampleBlockquote
          [ Deku.do
              setKlass1 /\ klass1 <- useState "text-sm"
              setKlass2 /\ klass2 <- useState "text-green-500"
              D.div_
                [ D.div_ $
                    [ setKlass1 /\ "text-2xl"
                    , setKlass1 /\ "text-sm"
                    , setKlass2 /\ "text-orange-500"
                    , setKlass2 /\ "text-green-300"
                    ] <#> \(f /\ k) -> D.button
                      (klass_ buttonClass <|> click_ (f k))
                      [ text_ k ]
                , D.div_
                    [ D.span (klass (klass1 <> pure " " <> klass2))
                        [ text_ "Hello!" ]
                    ]
                ]
          ]
      ]
  }
