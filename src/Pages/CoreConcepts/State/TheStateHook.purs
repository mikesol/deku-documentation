module Pages.CoreConcepts.State.TheStateHook where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Section, section)
import Control.Alt ((<|>))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click_)
import Effect.Random (random)
import Examples as Examples
import FRP.Event.Effect (bindToEffect)
import Pages.CoreConcepts.State.TheStateHook.PushingToAHook (pushingToAHook)
import Pages.CoreConcepts.State.TheStateHook.UsingTheHookInText (usingTheHookInText)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

theStateHook :: forall lock payload. Section lock payload
theStateHook = section
  { title: "The state hook"
  , topmatter: pure
      [ D.p__
          "Deku's state hooks are friendly lil' critters that fit comfortably on a single line and pack a lot of power. Let's see one now!"
      , psCodeWithLink Examples.TheStateHook
      , D.p__ "Here's the result."
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState'
              D.div_
                [ D.button
                    Alt.do
                      klass_ buttonClass
                      click_ $ random >>= setNumber
                    [ text_ "Update number" ]
                , text $ (bindToEffect (pure unit) (pure random) <|> number) <#>
                    show >>> ("Here's a random number: " <> _)
                ]
          ]
      ]
  , subsections:
      [ pushingToAHook
      , usingTheHookInText
      ]
  }
