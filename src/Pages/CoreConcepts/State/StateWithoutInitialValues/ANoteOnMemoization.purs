module Pages.CoreConcepts.State.StateWithoutInitialValues.ANoteOnMemoization where

import Prelude

import Contracts (Env(..), Subsection, subsection)
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
import Router.ADT (Route(..))

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
  { title: "A note on memoization"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "It's important to know that the hooks above are "
          , D.i__ "not"
          , text_
              " memoized, meaning that they do not store their most recent value. They simply pass through whatever comes down the pipe. This can lead to gotchyas if you're not careful. In the snippet below, for example, press button "
          , D.b__ "A"
          , text_ " a few times before pressing button "
          , D.b__ "B"
          , text_ ", and then after pressing "
          , D.b__ "B"
          , text_ " once, press"
          , D.b__ "A"
          , text_ " again. What do you think will happen?"
          ]
      , D.blockquote (klass_ "not-italic")
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
              "Because the hook simply passes through the values as it receives them, when "
          , D.b__ "B"
          , text_
              " was pressed, and as there was no simultaneous value coming from "
          , D.b__ "A"
          , text_ ", the guarded section didn't activate until "
          , D.b__ "A"
          , text_
              " was pressed again. In effect, while the hook had an initial value for the first "
          , D.code__ "text"
          , text_
              "bloc, it lacked an initial value for any bloc that was created afterwards. You can think of initial values to hooks as being relevant only at the moment of creation. Every subsequent usage of them is \"valueless\" until initialized."
          ]
      , D.p_
          [ text_
              "It is indeed possible to have hooks that always supply their most recent value, but it comes with a slight performance penalty. We'll see how this works in the "
          , routeLink MoreHooks
          , text_
              " section. Note that the performance penalty is negligible for most real-world applciations. You won't feel any lag in the example below, which is a memoized version of the example above. If you absolutely must learn how to implement it "
          , D.i__ "now"
          , text_ ", you can click "
          , D.b__ "Reveal code"
          , text_ "."
          ]
      , D.blockquote (klass_ "not-italic")
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
      ]
  }
