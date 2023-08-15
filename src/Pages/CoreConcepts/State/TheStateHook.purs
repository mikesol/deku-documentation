module Pages.CoreConcepts.State.TheStateHook where

import Prelude

import Components.ProTip (proTip)
import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Section, getExample, section)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import Pages.CoreConcepts.State.TheStateHook.PushingToAHook (pushingToAHook)
import Pages.CoreConcepts.State.TheStateHook.UsingTheHookInText (usingTheHookInText)

theStateHook :: Section
theStateHook = section
  { title: "The state hook"
  , topmatter: do
      example <- getExample StartCollapsed Nothing
        Examples.TheStateHook
      pure
       [ D.p__
          "Deku's state hooks fit comfortably on a single line and pack a lot of power. Let's see one now!"

      , example
      , proTip
          { header: text_ "Deku.do"
          , message: D.div_
              [ text_ "In Haskell-family languages, a "
              , D.code__ "do"
              , text
                  " block is a way to write nested function calls as a sequence of instructions. This is why Haskell and its progeny are often collectively referred to as "
              , targetedLink
                  "https://stackoverflow.com/questions/6622524/why-is-haskell-sometimes-referred-to-as-best-imperative-language"
                  [ text_ "the best imperative language" ]
              , text_ ". Different types of instructions use different "
              , D.code__ "do"
              , text
                  " blocks, and when you're working with Deku hooks, that block is "
              , D.code__ "Deku.do"
              , text_ "."
              ]
          }
      ]
  , subsections:
      [ pushingToAHook
      , usingTheHookInText
      ]
  }
