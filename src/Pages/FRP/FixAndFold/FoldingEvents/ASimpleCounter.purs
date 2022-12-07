module Pages.FRP.FixAndFold.FoldingEvents.ASimpleCounter where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Env(..), Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import FRP.Event (fold)
import QualifiedDo.Alt as Alt
import Router.ADT (Route(..))

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

example :: String
example = """module Main where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (fold)
import QualifiedDo.Alt as Alt

buttonClass =
  """ <> tripleQ <> """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" <> tripleQ <> """ :: String

main ∷ Effect Unit
main = runInBody Deku.do
  setCount /\ count <- useState 0
  D.div_
    [ D.button
        Alt.do
          klass_ buttonClass
          click $ count <#> (add 1 >>> setCount)
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
    ]"""

aSimpleCounter :: forall lock payload. Subsection lock payload
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
          , psCode example
      , exampleBlockquote
          [ Deku.do
              setCount /\ count <- useState 0
              D.div_
                [ D.button
                    Alt.do
                      klass_ buttonClass
                      click $ count <#> (add 1 >>> setCount)
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
