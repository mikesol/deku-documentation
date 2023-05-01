module Pages.Introduction.GettingStarted.QuickStart.StartingANewProject where

import Components.Code (shSessionCode)
import Contracts (Env(..), Subsection, subsection)
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Router.ADT (Route(..))

startingANewProject :: Subsection
startingANewProject = subsection
  { title: "Starting a new project"
  , matter: \(Env { routeLink }) ->
      [ D.p_
          [ text_ "The easiest way to get up-and-running with Deku is to use "
          , D.code_ [ text_ "create-deku-app" ]
          , text_ "."
          ]
      , shSessionCode "$ npx create-deku-app my-awesome-app"
      , D.p_
          [ text_
              "This will create a new Deku app in the directory "
          , D.code_ [ text_ "my-awesome-app" ]
          , text_
              " using a template with "
          , D.span [klass_ "line-through"] [ text_ "very opinionated" ]
          , text_ " sensible defaults."
          ]
      , D.p_
          [ text_
              "Just by doing this, you already have a full-fledged Deku app at the tips of your fingers. You can fire it up like so."
          ]
      , shSessionCode "$ cd my-awesome-app && npx spago build && npm run dev"
      , D.p_
          [ text_
              "Then, visit the link displayed in your terminal (usually "
          , D.code_ [ text_ "http://localhost:5173" ]
          , text_
              ") to see your site in action. It should bear an uncanny resemblance to the "
          , routeLink HelloWorld
          , text_ " we'll see on the next page."
          ]

      ]
  }

