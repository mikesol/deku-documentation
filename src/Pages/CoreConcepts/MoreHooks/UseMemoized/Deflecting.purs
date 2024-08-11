module Pages.CoreConcepts.MoreHooks.UseMemoized.Deflecting where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

deflecting :: Subsection
deflecting = subsection
  { title: "The useDeflect hook"
  , matter: do
      example <- getExample StartCollapsed Nothing Examples.TheUseDeflectHook
      pure
        [ D.p_
            [ text_
                "In the previous section, we saw that "
            , D.code__ "useRant"
            , text_
                " is almost memoization, but not quite. Full-blown memoization doesn't really exist or make sense for "
            , D.code__ "Poll"
            , text_ "s because of their "
            , D.code__ "Applicative"
            , text_
                " instance: what does it mean to memoize "
            , D.code__ "pure 1"
            , text_ "? Does it mean that, every time we consult the "
            , D.code__ "Poll"
            , text_ ", it should respond with "
            , D.code__ "1"
            , text_
                " right off the bat? Or does it mean that it should respond with "
            , D.code__ "1"
            , text_
                "at a given point in time and then no longer, because that time has passed? If so, what point in time are we talking about? So many questions!"
            ]
        , D.p_
            [ text_ "The "
            , D.code__ "useRant"
            , text_
                " hook sidesteps these issues by ignoring a "
            , D.code__ "Poll"
            , text_ "'s purity. For example "
            , D.code__ "useRant (pure 1 <|> pure 2)"
            , text_ " will emit nothing."
            , text_ "OTOH, "
            , D.code__ "useRant (pure 1 <|> pure 2 <|> e)"
            , text_ " will emit everyhting from "
            , D.code__ "e"
            , text_ " that's not "
            , D.code__ "pure"
            , text_ " and nothing else."
            ]
        , D.p_
            [ text_ "Usually, this feature of "
            , D.code__ "useRant"
            , text_
                " is not an issue because we’re dealing with some sort of stream like clicks and the initial value is context specific, so purity doesn't enter the equation. However, sometimes we want to find "
            , D.i__ "only"
            , text_ " the pure values of a "
            , D.code__ "Poll"
            , text_ ". For this, we have the "
            , D.code__ "useDeflect"
            , text_ " hook."
            ]
        , example
        ]
  }
