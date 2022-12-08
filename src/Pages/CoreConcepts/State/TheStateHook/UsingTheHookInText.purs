module Pages.CoreConcepts.State.TheStateHook.UsingTheHookInText where

import Components.Code (psCode)
import Components.Disclaimer (disclaimer)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

usingTheHookInText :: forall lock payload. Subsection lock payload
usingTheHookInText = subsection
  { title: "Using the hook in text"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_
              "Let's look at our hook again, this time focusing on the right side."
          ]
      , psCode """setNumber /\ number <- useState n"""
      , D.p_
          [ text_ "The right side of our hook is of type "
          , D.code__ "Event Number"
          , text_ "."
          ]
      , disclaimer
          { header: text_ "Raw values versus events"
          , message: D.div_
              [ text_
                  "If you're coming from React, the fact that Deku hooks do not contain raw values like "
              , D.code__ "Number"
              , text_ " or "
              , D.code__ "String"
              , text_ " but rather "
              , D.code__ "Event Number"
              , text_ " and "
              , D.code__ "Event String"
              , text_
                  " will be a big change. Even though they're not raw values, though, they can "
              , D.i__ "almost"
              , text_ " be used as such. In the "
              , routeLink Applicatives
              , text_ " section we'll learn how to do this."
              ]
          }
      , D.p_
          [ text_ "To use this event as DOM text, we'll use the "
          , D.code__ "text"
          , text_ " function."
          , D.code__ "text"
          , text_ " is like "
          , D.code__ "text_"
          , text_ ", but instead of taking a "
          , D.code__ "String"
          , text_ ", it accepts an argument of type "
          , D.code__ "Event String"
          , text_ ". As our hook is a number, we have to "
          , D.code__ "map"
          , text_ " over our "
          , D.code__ "Event Number"
          , text_ " to change it to an "
          , D.code__ "Event String"
          , text_ "."
          ]
      , psCode
          """text $ number <#>
  show >>> ("Here's a random number: " <> _)"""
      , D.p_
          [ text_ "The symbol "
          , D.code__ "<#>"
          , text_ " "
          , D.i__ "maps"
          , text_
              " over the event, turning its contents into some other type (in this case, "
          , D.code__ "String"
          , text_
              "). At this point, it's worth mentioning that if operators like "
          , D.code__ "$"
          , text_ ", "
          , D.code__ "<#>"
          , text_ ", and "
          , D.code__ "/\\"
          , text_
              " are unfamiliar to you, fear not! The PureScript documentation website "
          , targetedLink "https://pursuit.purescript.org"
              [ text_ "Pursuit" ]
          , text_
              " is your friend. You can search for all of these functions (and more) via the search bar."
          ]
      ]
  }
