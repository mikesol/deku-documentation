module Pages.Introduction.GettingStarted.QuickStart.StartingANewProject where

import Components.Code (shSessionCode)
import Contracts (Env(..), Subsection, subsection)
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Router.ADT (Route(..))

startingANewProject :: Subsection
startingANewProject = subsection
  { title: "Starting a new project"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text "The easiest way to get up-and-running with Deku is to use "
          , D.code_ [ text "create-deku-app" ]
          , text "."
          ]
      , shSessionCode "$ npx create-deku-app my-awesome-app"
      , D.p_
          [ text
              "This will create a new Deku app in the directory "
          , D.code_ [ text "my-awesome-app" ]
          , text
              " using a template with "
          , D.span [klass "line-through"] [ text "very opinionated" ]
          , text " sensible defaults."
          ]
      , D.p_
          [ text
              "Just by doing this, you already have a full-fledged Deku app at the tips of your fingers. You can fire it up like so."
          ]
      , shSessionCode "$ cd my-awesome-app && npx spago build && npm run dev"
      , D.p_
          [ text
              "Then, visit the link displayed in your terminal (usually "
          , D.code_ [ text "http://localhost:5173" ]
          , text
              ") to see your site in action. It should bear an uncanny resemblance to the "
          , routeLink HelloWorld
          , text " we'll see on the next page."
          ]

      ]
  }
