module Components.LeftMatterMobile where

import Prelude

import Assets (dekulogoURL, dekulogodarkURL)
import Components.Link (link, link')
import Contracts (Chapter(..), Page(..))
import Control.Plus (empty)
import Data.Newtype (unwrap)
import Data.NonEmpty (NonEmpty, (:|))
import Deku.Attribute ((:=))
import Deku.Attributes (klass, src)
import Deku.Control (text)
import Deku.Core (Nut)
import Deku.DOM as D
import FRP.Event (Event, merge)
import Navigation (PushState)
import Pages.Docs (docs)
import Router.ADT (Route(..))

pageLi
  :: { pageIs :: Route -> Event Unit
     , pageWas :: Route -> Event Unit
     , pushState :: PushState
     }
  -> Page
  -> Nut
pageLi { pushState, pageIs, pageWas } (Page { route }) = D.li
  [ D.Class := "relative" ]
  [ link pushState route
      [ klass $
          ( false :| merge [ pageIs route $> true, pageWas route $> false ]
          ) <#>
            ( if _ then
                "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full font-semibold text-sky-500 before:bg-sky-500"
              else
                "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
            )
      ]
  ]

chapterLi
  :: { pageIs :: Route -> Event Unit
     , pageWas :: Route -> Event Unit
     , pushState :: PushState
     }
  -> Chapter
  -> Nut
chapterLi opts (Chapter { title, pages }) = D.li_
  [ D.h2
      [ D.Class :=
          "font-display font-medium text-slate-900 dark:text-white"
      ]
      [ text title ]
  , D.ul
      [ D.Role := "list"
      , D.Class :=
          "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
      ]

      (pageLi opts <$> pages)
  ]

leftMatterMobile
  :: { navModalOpen :: NonEmpty Event Boolean
     , pageIs :: Route -> Event Unit
     , pageWas :: Route -> Event Unit
     , pushState :: PushState
     , darkBoolean :: Event Boolean
     }
  -> Nut
leftMatterMobile
  { navModalOpen, pushState, darkBoolean, pageIs, pageWas } =
  do
    let opts = { pageIs, pageWas, pushState }
    D.div
      [ klass $ navModalOpen <#> (if _ then "" else "hidden ") >>>
          ( _ <>
              "fixed inset-0 z-50 flex items-start overflow-y-auto bg-slate-900/50 pr-10 backdrop-blur lg:hidden"
          )
      -- , D.AriaLabel := "Navigation"
      , D.Id := "headlessui-dialog-:R4b6:"
      , D.Role := "dialog"
      -- , D.AriaModal := "true"
      ]

      [ D.div
          ( [ D.Class :=
                "min-h-full w-full max-w-xs bg-white px-4 pt-5 pb-12 dark:bg-slate-900 sm:px-6"
            , D.Id := "headlessui-dialog-panel-:r9:"
            ]
          )
          [ D.div [ D.Class := "flex items-center" ]
              [ D.button
                  ( [ D.Xtype := "button"
                    -- , D.AriaLabel := "Close navigation"
                    , D.Tabindex := "0"
                    ]
                  )
                  [ D.svg
                      ( [ -- D.AriaHidden := "true"
                          D.ViewBox := "0 0 24 24"
                        , D.Fill := "none"
                        , D.StrokeWidth := "2"
                        , D.StrokeLinecap := "round"
                        , D.Class := "h-6 w-6 stroke-slate-500"
                        ]
                      )
                      [ D.path [ D.D := "M5 5l14 14M19 5l-14 14" ] [] ]
                  ]
              , link' pushState GettingStarted empty
                  [ D.img
                      ( [ src $ darkBoolean <#> \dk ->
                            if dk then dekulogodarkURL else dekulogoURL
                        , klass "mb-2 ml-6 w-20 object-contain"
                        ]
                      )
                      []
                  ]
              ]
          , D.nav [ D.Class := "text-base lg:text-sm mt-5 px-1" ]
              [ D.ul ([ D.Role := "list", D.Class := "space-y-9" ])
                  (chapterLi opts <$> unwrap docs)
              -- [ D.li_
              --     [ D.h2
              --         ( D.Class :=
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text "Introduction" ]
              --     , D.ul
              --         ( oneOf
              --             [ D.Role := "list"
              --             , D.Class :=
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full font-semibold text-sky-500 before:bg-sky-500"
              --                     , D.Href := "/"
              --                     ]
              --                 )
              --                 [ text "Getting started" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/installation"
              --                     ]
              --                 )
              --                 [ text "Installation" ]
              --             ]
              --         ]
              --     ]
              -- , D.li_
              --     [ D.h2
              --         ( D.Class :=
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text "Core concepts" ]
              --     , D.ul
              --         ( oneOf
              --             [ D.Role := "list"
              --             , D.Class :=
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/understanding-caching"
              --                     ]
              --                 )
              --                 [ text "Understanding caching" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href :=
              --                         "/docs/predicting-user-behavior"
              --                     ]
              --                 )
              --                 [ text "Predicting user behavior" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/basics-of-time-travel"
              --                     ]
              --                 )
              --                 [ text "Basics of time-travel" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href :=
              --                         "/docs/introduction-to-string-theory"
              --                     ]
              --                 )
              --                 [ text "Introduction to string theory" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/the-butterfly-effect"
              --                     ]
              --                 )
              --                 [ text "The butterfly effect" ]
              --             ]
              --         ]
              --     ]
              -- , D.li_
              --     [ D.h2
              --         ( D.Class :=
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text "Advanced guides" ]
              --     , D.ul
              --         ( oneOf
              --             [ D.Role := "list"
              --             , D.Class :=
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/writing-plugins"
              --                     ]
              --                 )
              --                 [ text "Writing plugins" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/neuralink-integration"
              --                     ]
              --                 )
              --                 [ text "Neuralink integration" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/temporal-paradoxes"
              --                     ]
              --                 )
              --                 [ text "Temporal paradoxes" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/testing"
              --                     ]
              --                 )
              --                 [ text "Testing" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/compile-time-caching"
              --                     ]
              --                 )
              --                 [ text "Compile-time caching" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href :=
              --                         "/docs/predictive-data-generation"
              --                     ]
              --                 )
              --                 [ text "Predictive data generation" ]
              --             ]
              --         ]
              --     ]
              -- , D.li_
              --     [ D.h2
              --         ( D.Class :=
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text "API reference" ]
              --     , D.ul
              --         ( oneOf
              --             [ D.Role := "list"
              --             , D.Class :=
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/cacheadvance-predict"
              --                     ]
              --                 )
              --                 [ text "CacheAdvance.predict()" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/cacheadvance-flush"
              --                     ]
              --                 )
              --                 [ text "CacheAdvance.flush()" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/cacheadvance-revert"
              --                     ]
              --                 )
              --                 [ text "CacheAdvance.revert()" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/cacheadvance-regret"
              --                     ]
              --                 )
              --                 [ text "CacheAdvance.regret()" ]
              --             ]
              --         ]
              --     ]
              -- , D.li_
              --     [ D.h2
              --         ( D.Class :=
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text "Contributing" ]
              --     , D.ul
              --         ( oneOf
              --             [ D.Role := "list"
              --             , D.Class :=
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/how-to-contribute"
              --                     ]
              --                 )
              --                 [ text "How to contribute" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/architecture-guide"
              --                     ]
              --                 )
              --                 [ text "Architecture guide" ]
              --             ]
              --         , D.li (D.Class := "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ D.Class :=
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href := "/docs/design-principles"
              --                     ]
              --                 )
              --                 [ text "Design principles" ]
              --             ]
              --         ]
              --     ]
              -- ]
              ]
          ]
      ]