module Pages.FRP.FixAndFold.FoldingEvents.ASimpleCounter where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Env(..), Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Examples as Examples
import FRP.Event (fold)
import Router.ADT (Route(..))

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

aSimpleCounter :: Subsection
aSimpleCounter = subsection
  { title: "Two simple counters"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "Let's create two counters - one that uses the "
          , routeLink State
          , text_
              "-based methods we learned early in this documentation and one using folding. They'll both do the same thing, but the "
          , D.code__ "fold"
          , text_
              " method is a little classier, as you'll be able to brag to your friends that you're using fixed points. Your friends may appear indifferent, but they'll secretly envy you."
          ]
      , psCodeWithLink Examples.ASimpleCounter
      , exampleBlockquote
          [ Deku.do
              setCount /\ count <- useState 0
              D.div_
                [ D.button
                    [klass_ buttonClass,
                      click $ count <#> (add 1 >>> setCount)]
                    [ text_ "Increment" ]
                , D.div_
                    [ text_ "Counter 1 using state hooks: "
                    , text (show <$> count)
                    ]
                , D.div_
                    [ text_ "Counter 2 using "
                    , D.code__ "fold"
                    , text_ ": "
                    , text (show <$> (fold (pure <$> add 1) (-1) count))
                    ]
                ]
          ]
      ]
  }
