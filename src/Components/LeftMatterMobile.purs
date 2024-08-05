module Components.LeftMatterMobile where

import Prelude

import Assets (dekulogoURL, dekulogodarkURL)
import Components.Link (link, link')
import Contracts (Chapter(..), Page(..))
import Control.Plus (empty)
import Data.Foldable (oneOf)
import Data.Newtype (unwrap)
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.SVG as DS
import Deku.DOM.SVG.Attributes as DSA
import FRP.Poll (Poll)
import Pages.Docs (docs)
import Router.ADT (Route(..))

pageLi
  :: { pageIs :: Route -> Poll Unit
     , pageWas :: Route -> Poll Unit
     }
  -> Page
  -> Nut
pageLi { pageIs, pageWas } (Page { route }) = D.li
  [ DA.klass_ "relative" ]
  [ link route
      [ DA.klass $
          ( oneOf [ pure false, pageIs route $> true, pageWas route $> false ]
          ) <#>
            ( if _ then
                "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full font-semibold text-sky-500 before:bg-sky-500"
              else
                "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
            )
      ]
  ]

chapterLi
  :: { pageIs :: Route -> Poll Unit
     , pageWas :: Route -> Poll Unit
     }
  -> Chapter
  -> Nut
chapterLi opts (Chapter { title, pages }) = D.li_
  [ D.h2
      [ DA.klass_
          "font-display font-medium text-slate-900 dark:text-white"
      ]
      [ text_ title ]
  , D.ul
      [ DA.role_ "list"
      , DA.klass_
          "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
      ]

      (pageLi opts <$> pages)
  ]

leftMatterMobile
  :: { navModalOpen :: Poll Boolean
     , pageIs :: Route -> Poll Unit
     , pageWas :: Route -> Poll Unit
     , darkBoolean :: Poll Boolean
     }
  -> Nut
leftMatterMobile
  { navModalOpen, darkBoolean, pageIs, pageWas } =
  do
    let opts = { pageIs, pageWas }
    D.div
      [ DA.klass $ navModalOpen <#> (if _ then "" else "hidden ") >>>
          ( _ <>
              "fixed inset-0 z-50 flex items-start overflow-y-auto bg-slate-900/50 pr-10 backdrop-blur lg:hidden"
          )
      -- , D.AriaLabel_ "Navigation"
      , DA.id_ "headlessui-dialog-:R4b6:"
      , DA.role_ "dialog"
      -- , D.AriaModal_ "true"
      ]

      [ D.div
          ( [ DA.klass_
                "min-h-full w-full max-w-xs bg-white px-4 pt-5 pb-12 dark:bg-slate-900 sm:px-6"
            , DA.id_ "headlessui-dialog-panel-:r9:"
            ]
          )
          [ D.div [ DA.klass_ "flex items-center" ]
              [ D.button
                  ( [ DA.ariaLabel_ "Show navigation menu"
                    , DA.xtype_ "button"
                    -- , D.AriaLabel_ "Close navigation"
                    , DA.tabindex_ "0"
                    ]
                  )
                  [ DS.svg
                      ( [ -- D.AriaHidden_ "true"
                          DSA.viewBox_ "0 0 24 24"
                        , DSA.fill_ "none"
                        , DSA.strokeWidth_ "2"
                        , DSA.strokeLinecap_ "round"
                        , DA.klass_ "h-6 w-6 stroke-slate-500"
                        ]
                      )
                      [ DS.path [ DSA.d_ "M5 5l14 14M19 5l-14 14" ] [] ]
                  ]
              , link' GettingStarted empty
                  [ D.img
                      ( [ DA.src
                            ( darkBoolean <#> \dk ->
                                if dk then dekulogodarkURL else dekulogoURL
                            )
                        , DA.klass_ "mb-2 ml-6 w-20 object-contain"
                        ]
                      )
                      []
                  ]
              ]
          , D.nav [ DA.klass_ "text-base lg:text-sm mt-5 px-1" ]
              [ D.ul ([ DA.role_ "list", DA.klass_ "space-y-9" ])
                  (chapterLi opts <$> unwrap docs)
              -- [ D.li_
              --     [ D.h2
              --         ( DA.klass_
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text_ "Introduction" ]
              --     , D.ul
              --         ( oneOf
              --             [ DA.role_ "list"
              --             , DA.klass_
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full font-semibold text-sky-500 before:bg-sky-500"
              --                     , DA.href_ "/"
              --                     ]
              --                 )
              --                 [ text_ "Getting started" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/installation"
              --                     ]
              --                 )
              --                 [ text_ "Installation" ]
              --             ]
              --         ]
              --     ]
              -- , D.li_
              --     [ D.h2
              --         ( DA.klass_
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text_ "Core concepts" ]
              --     , D.ul
              --         ( oneOf
              --             [ DA.role_ "list"
              --             , DA.klass_
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/understanding-caching"
              --                     ]
              --                 )
              --                 [ text_ "Understanding caching" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href :=
              --                         "/docs/predicting-user-poll"
              --                     ]
              --                 )
              --                 [ text_ "Predicting user poll" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/basics-of-time-travel"
              --                     ]
              --                 )
              --                 [ text_ "Basics of time-travel" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href :=
              --                         "/docs/introduction-to-string-theory"
              --                     ]
              --                 )
              --                 [ text_ "Introduction to string theory" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/the-butterfly-effect"
              --                     ]
              --                 )
              --                 [ text_ "The butterfly effect" ]
              --             ]
              --         ]
              --     ]
              -- , D.li_
              --     [ D.h2
              --         ( DA.klass_
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text_ "Advanced guides" ]
              --     , D.ul
              --         ( oneOf
              --             [ DA.role_ "list"
              --             , DA.klass_
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/writing-plugins"
              --                     ]
              --                 )
              --                 [ text_ "Writing plugins" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/neuralink-integration"
              --                     ]
              --                 )
              --                 [ text_ "Neuralink integration" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/temporal-paradoxes"
              --                     ]
              --                 )
              --                 [ text_ "Temporal paradoxes" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/testing"
              --                     ]
              --                 )
              --                 [ text_ "Testing" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/compile-time-caching"
              --                     ]
              --                 )
              --                 [ text_ "Compile-time caching" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , D.Href :=
              --                         "/docs/predictive-data-generation"
              --                     ]
              --                 )
              --                 [ text_ "Predictive data generation" ]
              --             ]
              --         ]
              --     ]
              -- , D.li_
              --     [ D.h2
              --         ( DA.klass_
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text_ "API reference" ]
              --     , D.ul
              --         ( oneOf
              --             [ DA.role_ "list"
              --             , DA.klass_
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/cacheadvance-predict"
              --                     ]
              --                 )
              --                 [ text_ "CacheAdvance.predict()" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/cacheadvance-flush"
              --                     ]
              --                 )
              --                 [ text_ "CacheAdvance.flush()" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/cacheadvance-revert"
              --                     ]
              --                 )
              --                 [ text_ "CacheAdvance.revert()" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/cacheadvance-regret"
              --                     ]
              --                 )
              --                 [ text_ "CacheAdvance.regret()" ]
              --             ]
              --         ]
              --     ]
              -- , D.li_
              --     [ D.h2
              --         ( DA.klass_
              --             "font-display font-medium text-slate-900 dark:text-white"
              --         )
              --         [ text_ "Contributing" ]
              --     , D.ul
              --         ( oneOf
              --             [ DA.role_ "list"
              --             , DA.klass_
              --                 "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
              --             ]
              --         )
              --         [ D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/how-to-contribute"
              --                     ]
              --                 )
              --                 [ text_ "How to contribute" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/architecture-guide"
              --                     ]
              --                 )
              --                 [ text_ "Architecture guide" ]
              --             ]
              --         , D.li (DA.klass_ "relative")
              --             [ D.a
              --                 ( oneOf
              --                     [ DA.klass_
              --                         "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
              --                     , DA.href_ "/docs/design-principles"
              --                     ]
              --                 )
              --                 [ text_ "Design principles" ]
              --             ]
              --         ]
              --     ]
              -- ]
              ]
          ]
      ]