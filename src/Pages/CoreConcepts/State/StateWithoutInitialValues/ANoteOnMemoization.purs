module Pages.CoreConcepts.State.StateWithoutInitialValues.ANoteOnMemoization where

import Prelude

import Components.Code (psCode, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Data.String (replaceAll, Pattern(..), Replacement(..))
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (guard, text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useHot', useState, useState')
import Deku.Listeners (click)
import Effect.Random (random)
import Examples as Examples

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

aNoteOnMemoization :: Subsection
aNoteOnMemoization = subsection
  { title: "Memoization and useHot"
  , matter: pure
      [ D.p_
          [ text "It's important to know that the hooks above are "
          , D.i__ "not"
          , text
              " memoized, meaning that they do not store their most recent value. They simply pass through whatever comes down the pipe. This comes from Deku's tradition as an engine for games and interactive art, where events are often streams of data. However, in certain cases, like when an event holds a user profile, you always want to use the most recent value."
          ]
      , D.p_
          [ text
              "To see this in practice, in the snippet below, press button "
          , D.b__ "A"
          , text " a few times and then press "
          , D.b__ "B"
          , text " "
          , D.i__ "once and only once"
          , text " (even if you don't think it's responding). Then press "
          , D.b__ "A"
          , text " again a few times. What do you think will happen?"
          ]
      , psCodeWithLink Examples.ANoteOnMemoization
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState'
              setPresence /\ presence <- useState false
              D.div_
                [ D.div_
                    [ text $ (bindToEffect (pure unit) (pure random) <|> number)
                        <#> show >>>
                          ("Here's a random number: " <> _)
                    ]
                , D.div_
                    [ D.button
                        [klass $ buttonClass "pink",
                          click $ random >>= setNumber]
                        [ text "A"
                        ]
                    , D.button
                        [klass $ buttonClass "green",
                          click $ presence <#> not >>> setPresence]
                        [ text "B"
                        ]
                    ]
                , D.div_
                    [ guard presence
                        $ text
                        $ (number) <#> show >>>
                            ("Here's the same random number: " <> _)
                    ]
                ]
          ]
      , D.p_
          [ text
              "Because the hook simply passes through values as it receives them, as there was no simultaneous value coming from "
          , D.b__ "A"
          , text
              " when "
          , D.b__ "B"
          , text " was pressed, the guarded section didn't activate until "
          , D.b__ "A"
          , text
              " was pressed again. In effect, while the hook had an initial value "
          , D.code__ "n"
          , text " for the first "
          , D.code__ "text"
          , text
              "component, it lacked an initial value for any component that was created afterwards. You can think of initial values to hooks as being relevant only at the moment of creation."
          ]
      , D.p_
          [ text
              "It is indeed possible to have hooks that always supply their most recent value, but it comes with a slight performance penalty. Note that the performance penalty is negligible for most real-world applciations. You won't feel any lag in the example below, which is a memoized version of the example above. The only change is to use "
          , D.code__ "useHot"
          , text " instead of "
          , D.code__ "useState"
          , text "."
          ]
      , psCode
          """-- change this line
setNumber /\ number <- useHot n"""
      , D.p__ "And voilà the result."
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useHot'
              setPresence /\ presence <- useState false
              D.div_
                [ D.div_
                    [ text $ (bindToEffect (pure unit) (pure random) <|> number)
                        <#> show >>>
                          ("Here's a random number: " <> _)
                    ]
                , D.div_
                    [ D.button
                        [klass $ buttonClass "pink",
                          click $ random >>= setNumber]
                        [ text "A"
                        ]
                    , D.button
                        [klass $ buttonClass "green",
                          click $ presence <#> not >>> setPresence]
                        [ text "B"
                        ]
                    ]
                , D.div_
                    [ guard presence
                        $ text
                        $ (number) <#> show >>>
                            ("Here's the same random number: " <> _)
                    ]
                ]
          ]
      , D.p_
          [ text
              "As you work more with the framework, you'll get a sense of when "
          , D.code__ "useHot"
          , text " is necessary to achieve the outcome you want."
          ]
      ]
  }
