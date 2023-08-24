module Pages.CoreConcepts.Effects.Hydration.InjectingDependencies where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

injectingDependencies :: Subsection
injectingDependencies = subsection
  { title: "Injecting dependencies"
  , matter: do
      example <- getExample StartExpanded Nothing Examples.InjectingDependencies
      pure [ D.p_
          [ text_
              "Let's explore the Deku-ian effect model with a concrete example. Imagine that you are building an app called Image Roulette that reports when a user is watching or not watching an image. Whenever an image comes into focus, you need to ping the backend that it is being viewed, and whenever an image goes offscreen, you need to report that it is no longer being viewed."
          ]
      , D.p_
          [ text_ "In React, we would likely make a component called ie "
          , D.code__ "smartImage"
          , text_
              " that reports its own presence or absence via a REST API call on mount and dismount."
          ]
      , D.p__
          "In the following application, we'll implement a miniature version of Image Roulette with dummy functions for the following API calls:"
      , D.ul_
          [ D.li_
              [ D.code__ "fetchNewRandomImage"
              , text_
                  ": Fetch a new random image URL and increase the watcher count."
              ]
          , D.li_
              [ D.code__ "decreaseImageWatchCount"
              , text_ ": Indicate we are no longer looking at the image."
              ]
          ]
      , example
      , D.p_
          [ text_
              "The important thing to retain from this example is that the entire effect lifecycle controlled in the button's click listener. In addition to extricating effectful logic from the image presentation components, this has the added advantage of being able to throttle requests during loading."
          ]
      ]
  }
