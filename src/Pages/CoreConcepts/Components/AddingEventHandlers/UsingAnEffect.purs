module Pages.CoreConcepts.Components.AddingEventHandlers.UsingAnEffect where

import Prelude

import Components.Disclaimer (disclaimer)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

usingAnEffect :: Subsection
usingAnEffect = subsection
  { title: "Using an effect"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.UsingAnEffect
      pure
        [ D.p_
            [ text_
                "The most straightforward event is that which triggers an effectful action, like an alert or an audio snippet."
            ]
        , example
        , disclaimer
            { header: D.span_
                [ text_ "Do be do be do" ]
            , message: D.div_
                [ D.p__
                    "Functional programmers are notoriously lazy. In fact, there are entire languages, like Haskell, that are lazy. Part of our laziness is a disdain for parentheses, which not only requries two additional keystrokes, but forces us to press Shift at the same time. The gaul!"
                , D.p_
                    [ text_
                        "As a result, we often use "
                    , D.code__ "do"
                    , text_
                        " to separate blocks that would otherwise be in parentheses. "
                    , D.code__ "do"
                    , text_ " also pulls double duty (or "
                    , D.code__ "do"
                    , text_
                        "ty if you’re into puns) and is used to write sequential computations. But when there's only one computation, like in the example above, it acts like parentheses. If you think it's unfair that one linguistic construct can "
                    , D.code__ "do"
                    , text_
                        " multiple things at the same time, try learning how many things the word "
                    , D.b__ "です"
                    , text_ " means in Japanese. It makes "
                    , D.code__ "do"
                    , text_ " look tame by comparison."
                    ]
                ]
            }
        ]
  }
