module Pages.AdvancedUsage.AccessingTheDOM.ToplevelConsiderations.GlobalHandlers where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Env(..), Subsection, getEnv, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples
import Router.ADT (Route(..))

globalHandlers :: Subsection
globalHandlers = subsection
  { title: "Global handlers"
  , matter: do
      Env { routeLink } <- getEnv
      example <- getExample StartCollapsed Nothing Examples.GlobalHandlers
      pure [ D.p_
          [ text_
              "One common scenario in a web app is to have a top-level auth handler. We've already seen an example of this on the "
          , routeLink Providers
          , text_
              " page, but a more realistic example would be to sync a third-party auth API to the event-based architecture and pass the event to Deku."
          ]
      , D.p_
          [ text_ "In the example below, we use an API sold to use by "
          , D.b__ "FlakyAuth"
          , text_
              " to power our application's authentication. FlakyAuth provides a simple PureScript authentication API with the following single function:"
          ]
      , psCode """doAuth :: (Boolean -> Effect Unit) -> Effect (Effect Unit)"""
      , D.p_
          [ text_
              "The callback is invoked whenever auth state changes from true to false. The company has exceptionally given us permission to copy and paste their source code into the example below for instructional purposes."
          ],example
      , D.p_
          [ text_
              "Note that, for the Deku DOM to catch the initial auth event, it must be created "
          , D.i__ "before"
          , text_
              " the authentication handler is activated, otherwise it will miss the first event. An alternative to this is to create a "
          , D.code__ "burning"
          , text_
              " event, which memoizes its value for all future subscriptions."
          ]
      , psCode
          """main = do
  authEvent <- create
  myAuth <- burning false authEvent.event
  _ <- doAuth authEvent.push
  runInBody
    ( text $ myAuth.event <#>
        if _ then "Welcome back!" else "Please log in."
    )
  pure unit"""
      ]
  }
