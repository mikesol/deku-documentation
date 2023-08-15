module Pages.CoreConcepts.Effects.Hydration.InjectingDependencies where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

injectingDependencies :: Subsection
injectingDependencies = subsection
  { title: "Injecting dependencies"
  , matter: do
      example <- getExample StartExapanded Nothing Examples.InjectingDependencies
      pure [ D.p_
          [ text
              "Let's explore the Deku-ian effect model with a concrete example. Imagine that you are building an app called Image Roulette that reports when a user is watching or not watching an image. Whenever an image comes into focus, you need to report to the backend that it is being viewed, and whenever an image goes offscreen, you need to report that it is no longer being viewed."
          ]
      , D.p_
          [ text_ "You may be tempted to make a component called ie "
          , D.code__ "smartImage"
          , text
              " that reports its own presence or absence. Don't. Someone on your team will find it, start using it for other stuff, and pretty soon you'll accidentally have a bunch of API calls slowing down your app and you won't know why. Instead, "
          , D.i__ "inject"
          , text_ " this logic from the toplevel to the individual components."
          ]
      , D.p__
          "In the following application, we'll implement a miniature version of Image Roulette with dummy functions for the following API calls:"
      , D.ul_
          [ D.li_
              [ D.code__ "fetchNewRandomImage"
              , text
                  ": Fetch a new random image URL and increase the watcher count."
              ]
          , D.li_
              [ D.code__ "decreaseImageWatchCount"
              , text_ ": Indicate we are no longer looking at the image."
              ]
          ]
      , example
      , D.p_
          [ text
              "In the example above, we see the entire effect lifecycle controlled in the button's click listener. In addition to extricating effectful logic from the image presentation components, this has the added advantage of being able to throttle requests during loading."
          ]
      ]
  }
