module Pages.CoreConcepts.State.TheStateHook where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.ProTip (proTip)
import Components.TargetedLink (targetedLink)
import Contracts (Section, section)
import Control.Alt ((<|>))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)
import Effect.Random (random)
import Examples as Examples
import Pages.CoreConcepts.State.TheStateHook.PushingToAHook (pushingToAHook)
import Pages.CoreConcepts.State.TheStateHook.UsingTheHookInText (usingTheHookInText)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

theStateHook :: Section
theStateHook = section
  { title: "The state hook"
  , topmatter: pure
      [ D.p__
          "Deku's state hooks fit comfortably on a single line and pack a lot of power. Let's see one now!"
      , psCodeWithLink Examples.TheStateHook
      , D.p__ "Here's the result."
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState'
              D.div_
                [ D.button
                    [klass buttonClass,
                      click $ random >>= setNumber]
                    [ text "Update number" ]
                , text $ (bindToEffect (pure unit) (pure random) <|> number) <#>
                    show >>> ("Here's a random number: " <> _)
                ]
          ]
      , proTip
          { header: text "Deku.do"
          , message: D.div_
              [ text "In Haskell-family languages, a "
              , D.code__ "do"
              , text
                  " block is a way to write nested function calls as a sequence of instructions. This is why Haskell and its progeny are often collectively referred to as "
              , targetedLink
                  "https://stackoverflow.com/questions/6622524/why-is-haskell-sometimes-referred-to-as-best-imperative-language"
                  [ text "the best imperative language" ]
              , text ". Different types of instructions use different "
              , D.code__ "do"
              , text
                  " blocks, and when you're working with Deku hooks, that block is "
              , D.code__ "Deku.do"
              , text "."
              ]
          }
      ]
  , subsections:
      [ pushingToAHook
      , usingTheHookInText
      ]
  }
