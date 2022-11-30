module Pages.CoreConcepts.State.StateWithoutInitialValues.ANoteOnMemoization where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Constants (tripleQ)
import Contracts (Subsection, subsection)
import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useHot, useState)
import Deku.Listeners (click, click_)
import Effect.Random (random)
import QualifiedDo.Alt as Alt

-- bg-fuchsia-600
-- hover:bg-fuchsia-700 
-- focus:ring-fuchsia-500
buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mr-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

aNoteOnMemoization :: forall lock payload. Subsection lock payload
aNoteOnMemoization = subsection
  { title: "Memoization and useHot"
  , matter: pure
      [ D.p_
          [ text_ "It's important to know that the hooks above are "
          , D.i__ "not"
          , text_
              " memoized, meaning that they do not store their most recent value. They simply pass through whatever comes down the pipe. This comes from Deku's tradition as an engine for games and interactive art, where events are often streams of data. However, in certain cases, like when an event holds a user profile, you always want to use the most recent value."
          ]
      , D.p_
          [ text_
              "To see this in practice, in the snippet below, press button "
          , D.b__ "A"
          , text_ " a few times and then press "
          , D.b__ "B"
          , text_ " "
          , D.i__ "once and only once"
          , text_ " (even if you don't think it's responding). Then press "
          , D.b__ "A"
          , text_ " again a few times. What do you think will happen?"
          ]
      , psCode
          ( """module Main where

import Prelude

import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click, click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random (random)
import QualifiedDo.Alt as Alt

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """ <> tripleQ
              <>
                """ml-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""
              <> tripleQ
              <>
                """

main :: Effect Unit
main = runInBody Deku.do
  setNumber /\ number <- useState 0.42
  setPresence /\ presence <- useState false
  D.div_
    [ D.div_
        [ text $ number <#> show >>>
            ("Here's a random number: " <> _)
        ]
    , D.div_
        [ D.button
            Alt.do
              klass_ $ buttonClass "pink"
              click_ $ random >>= setNumber
            [ text_ "A"
            ]
        , D.button
            Alt.do
              klass_ $ buttonClass "green"
              click $ presence <#> not >>> setPresence
            [ text_ "B"
            ]
        ]
    , D.div_
        [ guard presence
            $ text
            $ number <#> show >>>
                ("Here's the same (?) random number: " <> _)
        ]
    ]"""
          )
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState 0.42
              setPresence /\ presence <- useState false
              D.div_
                [ D.div_
                    [ text $ number <#> show >>>
                        ("Here's a random number: " <> _)
                    ]
                , D.div_
                    [ D.button
                        Alt.do
                          klass_ $ buttonClass "pink"
                          click_ $ random >>= setNumber
                        [ text_ "A"
                        ]
                    , D.button
                        Alt.do
                          klass_ $ buttonClass "green"
                          click $ presence <#> not >>> setPresence
                        [ text_ "B"
                        ]
                    ]
                , D.div_
                    [ guard presence
                        $ text
                        $ number <#> show >>>
                            ("Here's the same (?) random number: " <> _)
                    ]
                ]
          ]
      , D.p_
          [ text_
              "Because the hook simply passes through the values as it receives them, as there was no simultaneous value coming from "
          , D.b__ "A"
          , text_
              " when "
          , D.b__ "B"
          , text_ " was pressed, the guarded section didn't activate until "
          , D.b__ "A"
          , text_
              " was pressed again. In effect, while the hook had an initial value for the first "
          , D.code__ "text"
          , text_
              "bloc, it lacked an initial value for any bloc that was created afterwards. You can think of initial values to hooks as being relevant only at the moment of creation. Every subsequent usage of them is \"valueless\" until initialized."
          ]
      , D.p_
          [ text_
              "It is indeed possible to have hooks that always supply their most recent value, but it comes with a slight performance penalty. Note that the performance penalty is negligible for most real-world applciations. You won't feel any lag in the example below, which is a memoized version of the example above. The only change is to use "
          , D.code__ "useHot"
          , text_ " instead of "
          , D.code__ "useState"
          , text_ "."
          ]
      , psCode
          """-- change this line
setNumber /\ number <- useHot 0.42"""
      , D.p__ "And voilà the result."
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useHot 0.42
              setPresence /\ presence <- useState false
              D.div_
                [ D.div_
                    [ text $ number <#> show >>>
                        ("Here's a random number: " <> _)
                    ]
                , D.div_
                    [ D.button
                        Alt.do
                          klass_ $ buttonClass "pink"
                          click_ $ random >>= setNumber
                        [ text_ "A"
                        ]
                    , D.button
                        Alt.do
                          klass_ $ buttonClass "green"
                          click $ presence <#> not >>> setPresence
                        [ text_ "B"
                        ]
                    ]
                , D.div_
                    [ guard presence
                        $ text
                        $ number <#> show >>>
                            ("Here's the same (?) random number: " <> _)
                    ]
                ]
          ]
      , D.p_
          [ text_
              "As you work more with the framework, you'll get a sense of when "
          , D.code__ "useHot"
          , text_ " is necessary to achieve the outcome you want."
          ]
      ]
  }
