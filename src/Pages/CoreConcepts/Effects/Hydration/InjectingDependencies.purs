module Pages.CoreConcepts.Effects.Hydration.InjectingDependencies where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Int (floor)
import Data.JSDate (getTime, now)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (blank, text, text_, (<#~>))
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Deku.Pursx ((~~))
import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class (liftEffect)
import Effect.Random (random)
import Examples as Examples
import Type.Proxy (Proxy(..))

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

data UIState
  = Beginning
  | Loading
  | Image { url :: String, watcherCount :: Int }

injectingDependencies :: Subsection
injectingDependencies = subsection
  { title: "Injecting dependencies"
  , matter: pure
      [ D.p_
          [ text_
              "Let's explore the Deku-ian effect model with a concrete example. Imagine that you are building an app called Image Roulette that reports when a user is watching or not watching an image. Whenever an image comes into focus, you need to report to the backend that it is being viewed, and whenever an image goes offscreen, you need to report that it is no longer being viewed."
          ]
      , D.p_
          [ text_ "You may be tempted to make a component called ie "
          , D.code__ "smartImage"
          , text_
              " that reports its own presence or absence. Don't. Someone on your team will find it, start using it for other stuff, and pretty soon you'll accidentally have a bunch of API calls slowing down your app and you won't know why. Instead, "
          , D.i__ "inject"
          , text_ " this logic from the toplevel to the individual components."
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
      , psCodeWithLink Examples.InjectingDependencies
      , exampleBlockquote
          [ Deku.do
              let
                fetchNewRandomImage = do
                  delay (Milliseconds 300.0)
                  n <- liftEffect (getTime <$> now)
                  c <- liftEffect random
                  pure $
                    { url: "https://picsum.photos/seed/" <> show n <> "/200"
                    , watcherCount: floor (c * 4200.0)
                    }
                decreaseImageWatchCount _ = do
                  delay (Milliseconds 300.0)
                  c <- liftEffect random
                  pure $ { watcherCount: floor (c * 4200.0) }
              setUIState /\ uiState <- useState Beginning
              D.div_
                [ D.button
                    [ klass_ buttonClass
                    , let
                        fetcher = fetchNewRandomImage >>= liftEffect
                          <<< setUIState
                          <<< Image
                        loader = liftEffect $ setUIState Loading
                      in
                        click $ uiState <#> case _ of
                          Beginning -> do
                            launchAff_ do
                              loader
                              fetcher
                          Loading -> pure unit
                          Image { url } ->
                            launchAff_ do
                              loader
                              _ <- decreaseImageWatchCount url
                              fetcher
                    ]
                    [ text $ uiState <#> case _ of
                        Beginning -> "Get Image"
                        _ -> "Change Image"
                    ]
                , D.div_
                    [ uiState <#~> case _ of
                        Beginning -> blank
                        Image { url, watcherCount } -> D.div_
                          [ D.img [D.Src !:= url] []
                          , D.div_
                              [ text_ $
                                  "Watcher count (including you): " <> show
                                    watcherCount
                              ]
                          ]
                        Loading ->
                          D.div [klass_ "p-10"]
                            [ ( ( Proxy
                                    :: _
                                         """<div role="status">
    <svg aria-hidden="true" class="mr-2 w-8 h-8 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="currentColor"/>
        <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="currentFill"/>
    </svg>
    <span class="sr-only">Loading...</span>
</div>"""
                                ) ~~ {}
                              )
                            ]
                    ]
                ]
          ]
      , D.p_
          [ text_
              "In the example above, we see the entire effect lifecycle controlled in the button's click listener. In addition to extricating effectful logic from the image presentation components, this has the added advantage of being able to throttle requests during loading."
          ]
      ]
  }
