module Pages.CoreConcepts.State.TheStateHook.UsingTheHookInText where

import Components.Code (psCode)
import Components.Disclaimer (disclaimer)
import Components.TargetedLink (targetedLink)
import Contracts (Env(..), Subsection, subsection)
import Deku.Control (text)
import Deku.DOM as D
import Router.ADT (Route(..))

usingTheHookInText :: Subsection
usingTheHookInText = subsection
  { title: "Using the hook in text"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text
              "Let's look at our hook again, this time focusing on the right side."
          ]
      , psCode """setNumber /\ number <- useState n"""
      , D.p_
          [ text "The right side of our hook is of type "
          , D.code__ "Event Number"
          , text "."
          ]
      , disclaimer
          { header: text "Raw values versus events"
          , message: D.div_
              [ text
                  "If you're coming from React, the fact that Deku hooks do not contain raw values like "
              , D.code__ "Number"
              , text " or "
              , D.code__ "String"
              , text " but rather "
              , D.code__ "Event Number"
              , text " and "
              , D.code__ "Event String"
              , text
                  " will be a big change. Even though they're not raw values, though, they can "
              , D.i__ "almost"
              , text " be used as such. In the "
              , routeLink Applicatives
              , text " section we'll learn how to do this."
              ]
          }
      , D.p_
          [ text "To use this event as DOM text, we'll use the "
          , D.code__ "text"
          , text " function."
          , D.code__ "text"
          , text " is like "
          , D.code__ "text"
          , text ", but instead of taking a "
          , D.code__ "String"
          , text ", it accepts an argument of type "
          , D.code__ "Event String"
          , text ". As our hook is a number, we have to "
          , D.code__ "map"
          , text " over our "
          , D.code__ "Event Number"
          , text " to change it to an "
          , D.code__ "Event String"
          , text "."
          ]
      , psCode
          """text $ number <#>
  show >>> ("Here's a random number: " <> _)"""
      , D.p_
          [ text "The symbol "
          , D.code__ "<#>"
          , text " "
          , D.i__ "maps"
          , text
              " over the event, turning its contents into some other type (in this case, "
          , D.code__ "String"
          , text
              "). At this point, it's worth mentioning that if operators like "
          , D.code__ "$"
          , text ", "
          , D.code__ "<#>"
          , text ", and "
          , D.code__ "/\\"
          , text
              " are unfamiliar to you, fear not! The PureScript documentation website "
          , targetedLink "https://pursuit.purescript.org"
              [ text "Pursuit" ]
          , text
              " is your friend. You can search for all of these functions (and more) via the search bar."
          ]
      ]
  }
