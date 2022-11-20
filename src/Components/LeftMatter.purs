module Components.LeftMatter where

import Deku.Core (Nut)
import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D

leftMatter :: Nut
leftMatter = D.div (D.Class !:= "hidden lg:relative lg:block lg:flex-none")
  [ D.div
      ( D.Class !:=
          "absolute inset-y-0 right-0 w-[50vw] bg-slate-50 dark:hidden"
      )
      []
  , D.div
      ( D.Class !:=
          "absolute top-16 bottom-0 right-0 hidden h-12 w-px bg-gradient-to-t from-slate-800 dark:block"
      )
      []
  , D.div
      ( D.Class !:=
          "absolute top-28 bottom-0 right-0 hidden w-px bg-slate-800 dark:block"
      )
      []
  , D.div
      ( D.Class !:=
          "sticky top-[4.5rem] -ml-0.5 h-[calc(100vh-4.5rem)] overflow-y-auto overflow-x-hidden py-16 pl-0.5"
      )
      [ D.nav
          ( D.Class !:=
              "text-base lg:text-sm w-64 pr-8 xl:w-72 xl:pr-16"
          )
          [ D.ul (oneOf [ D.Role !:= "list", D.Class !:= "space-y-9" ])
              [ D.li_
                  [ D.h2
                      ( D.Class !:=
                          "font-display font-medium text-slate-900 dark:text-white"
                      )
                      [ text_ "Introduction" ]
                  , D.ul
                      ( oneOf
                          [ D.Role !:= "list"
                          , D.Class !:=
                              "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
                          ]
                      )
                      [ D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full font-semibold text-sky-500 before:bg-sky-500"
                                  , D.Href !:= "/"
                                  ]
                              )
                              [ text_ "Getting started" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:= "/docs/installation"
                                  ]
                              )
                              [ text_ "Installation" ]
                          ]
                      ]
                  ]
              , D.li_
                  [ D.h2
                      ( D.Class !:=
                          "font-display font-medium text-slate-900 dark:text-white"
                      )
                      [ text_ "Core concepts" ]
                  , D.ul
                      ( oneOf
                          [ D.Role !:= "list"
                          , D.Class !:=
                              "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
                          ]
                      )
                      [ D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/understanding-caching"
                                  ]
                              )
                              [ text_ "Understanding caching" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/predicting-user-behavior"
                                  ]
                              )
                              [ text_ "Predicting user behavior" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/basics-of-time-travel"
                                  ]
                              )
                              [ text_ "Basics of time-travel" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/introduction-to-string-theory"
                                  ]
                              )
                              [ text_ "Introduction to string theory" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/the-butterfly-effect"
                                  ]
                              )
                              [ text_ "The butterfly effect" ]
                          ]
                      ]
                  ]
              , D.li_
                  [ D.h2
                      ( D.Class !:=
                          "font-display font-medium text-slate-900 dark:text-white"
                      )
                      [ text_ "Advanced guides" ]
                  , D.ul
                      ( oneOf
                          [ D.Role !:= "list"
                          , D.Class !:=
                              "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
                          ]
                      )
                      [ D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:= "/docs/writing-plugins"
                                  ]
                              )
                              [ text_ "Writing plugins" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/neuralink-integration"
                                  ]
                              )
                              [ text_ "Neuralink integration" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/temporal-paradoxes"
                                  ]
                              )
                              [ text_ "Temporal paradoxes" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:= "/docs/testing"
                                  ]
                              )
                              [ text_ "Testing" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/compile-time-caching"
                                  ]
                              )
                              [ text_ "Compile-time caching" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/predictive-data-generation"
                                  ]
                              )
                              [ text_ "Predictive data generation" ]
                          ]
                      ]
                  ]
              , D.li_
                  [ D.h2
                      ( D.Class !:=
                          "font-display font-medium text-slate-900 dark:text-white"
                      )
                      [ text_ "API reference" ]
                  , D.ul
                      ( oneOf
                          [ D.Role !:= "list"
                          , D.Class !:=
                              "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
                          ]
                      )
                      [ D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/cacheadvance-predict"
                                  ]
                              )
                              [ text_ "CacheAdvance.predict()" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/cacheadvance-flush"
                                  ]
                              )
                              [ text_ "CacheAdvance.flush()" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/cacheadvance-revert"
                                  ]
                              )
                              [ text_ "CacheAdvance.revert()" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/cacheadvance-regret"
                                  ]
                              )
                              [ text_ "CacheAdvance.regret()" ]
                          ]
                      ]
                  ]
              , D.li_
                  [ D.h2
                      ( D.Class !:=
                          "font-display font-medium text-slate-900 dark:text-white"
                      )
                      [ text_ "Contributing" ]
                  , D.ul
                      ( oneOf
                          [ D.Role !:= "list"
                          , D.Class !:=
                              "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
                          ]
                      )
                      [ D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:= "/docs/how-to-contribute"
                                  ]
                              )
                              [ text_ "How to contribute" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:=
                                      "/docs/architecture-guide"
                                  ]
                              )
                              [ text_ "Architecture guide" ]
                          ]
                      , D.li (D.Class !:= "relative")
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
                                  , D.Href !:= "/docs/design-principles"
                                  ]
                              )
                              [ text_ "Design principles" ]
                          ]
                      ]
                  ]
              ]
          ]
      ]
  ]