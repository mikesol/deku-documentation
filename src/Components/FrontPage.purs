module Components.FrontPage where


import Components.Banner (banner)
import Components.BottomNav (bottomNav)
import Components.Disclaimer (disclaimer)
import Components.Header (header)
import Components.ProTip (proTip)
import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.Core (Nut, fixed)
import Deku.DOM as D

everything :: Nut
everything = fixed
  [ header
  , banner
  , D.div
      ( D.Class !:=
          "relative mx-auto flex max-w-8xl justify-center sm:px-2 lg:px-8 xl:px-12"
      )
      [ D.div (D.Class !:= "hidden lg:relative lg:block lg:flex-none")
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
      , D.div
          ( D.Class !:=
              "min-w-0 max-w-2xl flex-auto px-4 py-16 lg:max-w-none lg:pr-0 lg:pl-8 xl:px-16"
          )
          [ D.article_
              [ D.header
                  ( oneOf
                      [ D.Class !:= "mb-9 space-y-1"
                      ]
                  )
                  [ D.p
                      ( oneOf
                          [ D.Class !:=
                              "font-display text-sm font-medium text-sky-500"
                          ]
                      )
                      [ text_ "Introduction" ]
                  , D.h1
                      ( oneOf
                          [ D.Id !:= "getting-started"
                          , D.Class !:=
                              "font-display text-3xl tracking-tight text-slate-900 dark:text-white"
                          ]
                      )
                      [ text_ "Getting started" ]
                  ]
              , D.div
                  ( D.Class !:=
                      "prose prose-slate max-w-none dark:prose-invert dark:text-slate-400 prose-headings:scroll-mt-28 prose-headings:font-display prose-headings:font-normal lg:prose-headings:scroll-mt-[8.5rem] prose-lead:text-slate-500 dark:prose-lead:text-slate-400 prose-a:font-semibold dark:prose-a:text-sky-400 prose-a:no-underline prose-a:shadow-[inset_0_-2px_0_0_var(--tw-prose-background,#fff),inset_0_calc(-1*(var(--tw-prose-underline-size,4px)+2px))_0_0_var(--tw-prose-underline,theme(colors.sky.300))] hover:prose-a:[--tw-prose-underline-size:6px] dark:[--tw-prose-background:theme(colors.slate.900)] dark:prose-a:shadow-[inset_0_calc(-1*var(--tw-prose-underline-size,2px))_0_0_var(--tw-prose-underline,theme(colors.sky.800))] dark:hover:prose-a:[--tw-prose-underline-size:6px] prose-pre:rounded-xl prose-pre:bg-slate-900 prose-pre:shadow-lg dark:prose-pre:bg-slate-800/60 dark:prose-pre:shadow-none dark:prose-pre:ring-1 dark:prose-pre:ring-slate-300/10 dark:prose-hr:border-slate-800"
                  )
                  [ D.p (D.Class !:= "lead")
                      [ text_
                          "Learn how to get CacheAdvance set up in your project in under thirty minutes or it's free. "
                      ]
                  , D.div
                      ( D.Class !:=
                          "not-prose my-12 grid grid-cols-1 gap-6 sm:grid-cols-2"
                      )
                      [ D.div
                          ( D.Class !:=
                              "group relative rounded-xl border border-slate-200 dark:border-slate-800"
                          )
                          [ D.div
                              ( D.Class !:=
                                  "absolute -inset-px rounded-xl border-2 border-transparent opacity-0 [background:linear-gradient(var(--quick-links-hover-bg,theme(colors.sky.50)),var(--quick-links-hover-bg,theme(colors.sky.50)))_padding-box,linear-gradient(to_top,theme(colors.indigo.400),theme(colors.cyan.400),theme(colors.sky.500))_border-box] group-hover:opacity-100 dark:[--quick-links-hover-bg:theme(colors.slate.800)]"
                              )
                              []
                          , D.div
                              ( D.Class !:=
                                  "relative overflow-hidden rounded-xl p-6"
                              )
                              [ D.svg
                                  ( oneOf
                                      [ D.AriaHidden !:= "true"
                                      , D.ViewBox !:= "0 0 32 32"
                                      , D.Fill !:= "none"
                                      , D.Class !:=
                                          "h-8 w-8 [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"
                                      ]
                                  )
                                  [ D.defs_
                                      [ D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:= ":R6456sm:-gradient"
                                              , D.GradientTransform !:=
                                                  "matrix(0 21 -21 0 12 3)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      , D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:=
                                                  ":R6456sm:-gradient-dark"
                                              , D.GradientTransform !:=
                                                  "matrix(0 21 -21 0 16 7)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      ]
                                  , D.g (D.Class !:= "dark:hidden")
                                      [ D.circle
                                          ( oneOf
                                              [ D.Cx !:= "12"
                                              , D.Cy !:= "12"
                                              , D.R !:= "12"
                                              , D.Fill !:=
                                                  "url(#:R6456sm:-gradient)"
                                              ]
                                          )
                                          []
                                      , D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "m8 8 9 21 2-10 10-2L8 8Z"
                                              , D.FillOpacity !:= "0.5"
                                              , D.Class !:=
                                                  "fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]"
                                              , D.StrokeWidth !:= "2"
                                              , D.StrokeLinecap !:= "round"
                                              , D.StrokeLinejoin !:= "round"
                                              ]
                                          )
                                          []
                                      ]
                                  , D.g (D.Class !:= "hidden dark:inline")
                                      [ D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "m4 4 10.286 24 2.285-11.429L28 14.286 4 4Z"
                                              , D.Fill !:=
                                                  "url(#:R6456sm:-gradient-dark)"
                                              , D.Stroke !:=
                                                  "url(#:R6456sm:-gradient-dark)"
                                              , D.StrokeWidth !:= "2"
                                              , D.StrokeLinecap !:= "round"
                                              , D.StrokeLinejoin !:= "round"
                                              ]
                                          )
                                          []
                                      ]
                                  ]
                              , D.h2
                                  ( D.Class !:=
                                      "mt-4 font-display text-base text-slate-900 dark:text-white"
                                  )
                                  [ D.a (D.Href !:= "/")
                                      [ D.span
                                          ( D.Class !:=
                                              "absolute -inset-px rounded-xl"
                                          )
                                          []
                                      , text_ "Installation"
                                      ]
                                  ]
                              , D.p
                                  ( D.Class !:=
                                      "mt-1 text-sm text-slate-700 dark:text-slate-400"
                                  )
                                  [ text_
                                      "Step-by-step guides to setting up your system and installing the library."
                                  ]
                              ]
                          ]
                      , D.div
                          ( D.Class !:=
                              "group relative rounded-xl border border-slate-200 dark:border-slate-800"
                          )
                          [ D.div
                              ( D.Class !:=
                                  "absolute -inset-px rounded-xl border-2 border-transparent opacity-0 [background:linear-gradient(var(--quick-links-hover-bg,theme(colors.sky.50)),var(--quick-links-hover-bg,theme(colors.sky.50)))_padding-box,linear-gradient(to_top,theme(colors.indigo.400),theme(colors.cyan.400),theme(colors.sky.500))_border-box] group-hover:opacity-100 dark:[--quick-links-hover-bg:theme(colors.slate.800)]"
                              )
                              []
                          , D.div
                              ( D.Class !:=
                                  "relative overflow-hidden rounded-xl p-6"
                              )
                              [ D.svg
                                  ( oneOf
                                      [ D.AriaHidden !:= "true"
                                      , D.ViewBox !:= "0 0 32 32"
                                      , D.Fill !:= "none"
                                      , D.Class !:=
                                          "h-8 w-8 [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"
                                      ]
                                  )
                                  [ D.defs_
                                      [ D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:= ":R6856sm:-gradient"
                                              , D.GradientTransform !:=
                                                  "matrix(0 21 -21 0 20 3)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      , D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:=
                                                  ":R6856sm:-gradient-dark"
                                              , D.GradientTransform !:=
                                                  "matrix(0 22.75 -22.75 0 16 6.25)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      ]
                                  , D.g (D.Class !:= "dark:hidden")
                                      [ D.circle
                                          ( oneOf
                                              [ D.Cx !:= "20"
                                              , D.Cy !:= "12"
                                              , D.R !:= "12"
                                              , D.Fill !:=
                                                  "url(#:R6856sm:-gradient)"
                                              ]
                                          )
                                          []
                                      , D.g
                                          ( oneOf
                                              [ D.Class !:=
                                                  "fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]"
                                              , D.FillOpacity !:= "0.5"
                                              , D.StrokeWidth !:= "2"
                                              , D.StrokeLinecap !:= "round"
                                              , D.StrokeLinejoin !:= "round"
                                              ]
                                          )
                                          [ D.path
                                              ( D.D !:=
                                                  "M3 5v12a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2Z"
                                              )
                                              []
                                          , D.path
                                              ( D.D !:=
                                                  "M18 17v10a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V17a2 2 0 0 0-2-2h-7a2 2 0 0 0-2 2Z"
                                              )
                                              []
                                          , D.path
                                              ( D.D !:=
                                                  "M18 5v4a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2h-7a2 2 0 0 0-2 2Z"
                                              )
                                              []
                                          , D.path
                                              ( D.D !:=
                                                  "M3 25v2a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2Z"
                                              )
                                              []
                                          ]
                                      ]
                                  , D.g
                                      ( oneOf
                                          [ D.Class !:= "hidden dark:inline"
                                          , D.Fill !:=
                                              "url(#:R6856sm:-gradient-dark)"
                                          ]
                                      )
                                      [ D.path
                                          ( oneOf
                                              [ D.FillRule !:= "evenodd"
                                              , D.ClipRule !:= "evenodd"
                                              , D.D !:=
                                                  "M3 17V4a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1Zm16 10v-9a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-6a2 2 0 0 1-2-2Zm0-23v5a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1h-8a1 1 0 0 0-1 1ZM3 28v-3a1 1 0 0 1 1-1h9a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1Z"
                                              ]
                                          )
                                          []
                                      , D.path
                                          ( D.D !:=
                                              "M2 4v13h2V4H2Zm2-2a2 2 0 0 0-2 2h2V2Zm8 0H4v2h8V2Zm2 2a2 2 0 0 0-2-2v2h2Zm0 13V4h-2v13h2Zm-2 2a2 2 0 0 0 2-2h-2v2Zm-8 0h8v-2H4v2Zm-2-2a2 2 0 0 0 2 2v-2H2Zm16 1v9h2v-9h-2Zm3-3a3 3 0 0 0-3 3h2a1 1 0 0 1 1-1v-2Zm6 0h-6v2h6v-2Zm3 3a3 3 0 0 0-3-3v2a1 1 0 0 1 1 1h2Zm0 9v-9h-2v9h2Zm-3 3a3 3 0 0 0 3-3h-2a1 1 0 0 1-1 1v2Zm-6 0h6v-2h-6v2Zm-3-3a3 3 0 0 0 3 3v-2a1 1 0 0 1-1-1h-2Zm2-18V4h-2v5h2Zm0 0h-2a2 2 0 0 0 2 2V9Zm8 0h-8v2h8V9Zm0 0v2a2 2 0 0 0 2-2h-2Zm0-5v5h2V4h-2Zm0 0h2a2 2 0 0 0-2-2v2Zm-8 0h8V2h-8v2Zm0 0V2a2 2 0 0 0-2 2h2ZM2 25v3h2v-3H2Zm2-2a2 2 0 0 0-2 2h2v-2Zm9 0H4v2h9v-2Zm2 2a2 2 0 0 0-2-2v2h2Zm0 3v-3h-2v3h2Zm-2 2a2 2 0 0 0 2-2h-2v2Zm-9 0h9v-2H4v2Zm-2-2a2 2 0 0 0 2 2v-2H2Z"
                                          )
                                          []
                                      ]
                                  ]
                              , D.h2
                                  ( D.Class !:=
                                      "mt-4 font-display text-base text-slate-900 dark:text-white"
                                  )
                                  [ D.a (D.Href !:= "/")
                                      [ D.span
                                          ( D.Class !:=
                                              "absolute -inset-px rounded-xl"
                                          )
                                          []
                                      , text_ "Architecture guide"
                                      ]
                                  ]
                              , D.p
                                  ( D.Class !:=
                                      "mt-1 text-sm text-slate-700 dark:text-slate-400"
                                  )
                                  [ text_
                                      "Learn how the internals work and contribute."
                                  ]
                              ]
                          ]
                      , D.div
                          ( D.Class !:=
                              "group relative rounded-xl border border-slate-200 dark:border-slate-800"
                          )
                          [ D.div
                              ( D.Class !:=
                                  "absolute -inset-px rounded-xl border-2 border-transparent opacity-0 [background:linear-gradient(var(--quick-links-hover-bg,theme(colors.sky.50)),var(--quick-links-hover-bg,theme(colors.sky.50)))_padding-box,linear-gradient(to_top,theme(colors.indigo.400),theme(colors.cyan.400),theme(colors.sky.500))_border-box] group-hover:opacity-100 dark:[--quick-links-hover-bg:theme(colors.slate.800)]"
                              )
                              []
                          , D.div
                              ( D.Class !:=
                                  "relative overflow-hidden rounded-xl p-6"
                              )
                              [ D.svg
                                  ( oneOf
                                      [ D.AriaHidden !:= "true"
                                      , D.ViewBox !:= "0 0 32 32"
                                      , D.Fill !:= "none"
                                      , D.Class !:=
                                          "h-8 w-8 [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"
                                      ]
                                  )
                                  [ D.defs_
                                      [ D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:= ":R6c56sm:-gradient"
                                              , D.GradientTransform !:=
                                                  "matrix(0 21 -21 0 20 11)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      , D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:=
                                                  ":R6c56sm:-gradient-dark-1"
                                              , D.GradientTransform !:=
                                                  "matrix(0 22.75 -22.75 0 16 6.25)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      , D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:=
                                                  ":R6c56sm:-gradient-dark-2"
                                              , D.GradientTransform !:=
                                                  "matrix(0 14 -14 0 16 10)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      ]
                                  , D.g (D.Class !:= "dark:hidden")
                                      [ D.circle
                                          ( oneOf
                                              [ D.Cx !:= "20"
                                              , D.Cy !:= "20"
                                              , D.R !:= "12"
                                              , D.Fill !:=
                                                  "url(#:R6c56sm:-gradient)"
                                              ]
                                          )
                                          []
                                      , D.g
                                          ( oneOf
                                              [ D.FillOpacity !:= "0.5"
                                              , D.Class !:=
                                                  "fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]"
                                              , D.StrokeWidth !:= "2"
                                              , D.StrokeLinecap !:= "round"
                                              , D.StrokeLinejoin !:= "round"
                                              ]
                                          )
                                          [ D.path
                                              (D.D !:= "M3 9v14l12 6V15L3 9Z")
                                              []
                                          , D.path
                                              ( D.D !:=
                                                  "M27 9v14l-12 6V15l12-6Z"
                                              )
                                              []
                                          ]
                                      , D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "M11 4h8v2l6 3-10 6L5 9l6-3V4Z"
                                              , D.FillOpacity !:= "0.5"
                                              , D.Class !:=
                                                  "fill-[var(--icon-background)]"
                                              ]
                                          )
                                          []
                                      , D.g
                                          ( oneOf
                                              [ D.Class !:=
                                                  "stroke-[color:var(--icon-foreground)]"
                                              , D.StrokeWidth !:= "2"
                                              , D.StrokeLinecap !:= "round"
                                              , D.StrokeLinejoin !:= "round"
                                              ]
                                          )
                                          [ D.path
                                              ( D.D !:=
                                                  "M20 5.5 27 9l-12 6L3 9l7-3.5"
                                              )
                                              []
                                          , D.path
                                              ( D.D !:=
                                                  "M20 5c0 1.105-2.239 2-5 2s-5-.895-5-2m10 0c0-1.105-2.239-2-5-2s-5 .895-5 2m10 0v3c0 1.105-2.239 2-5 2s-5-.895-5-2V5"
                                              )
                                              []
                                          ]
                                      ]
                                  , D.g
                                      ( oneOf
                                          [ D.Class !:= "hidden dark:inline"
                                          , D.StrokeWidth !:= "2"
                                          , D.StrokeLinecap !:= "round"
                                          , D.StrokeLinejoin !:= "round"
                                          ]
                                      )
                                      [ D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "M17.676 3.38a3.887 3.887 0 0 0-3.352 0l-9 4.288C3.907 8.342 3 9.806 3 11.416v9.168c0 1.61.907 3.073 2.324 3.748l9 4.288a3.887 3.887 0 0 0 3.352 0l9-4.288C28.093 23.657 29 22.194 29 20.584v-9.168c0-1.61-.907-3.074-2.324-3.748l-9-4.288Z"
                                              , D.Stroke !:=
                                                  "url(#:R6c56sm:-gradient-dark-1)"
                                              ]
                                          )
                                          []
                                      , D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "M16.406 8.087a.989.989 0 0 0-.812 0l-7 3.598A1.012 1.012 0 0 0 8 12.61v6.78c0 .4.233.762.594.925l7 3.598a.989.989 0 0 0 .812 0l7-3.598c.361-.163.594-.525.594-.925v-6.78c0-.4-.233-.762-.594-.925l-7-3.598Z"
                                              , D.Fill !:=
                                                  "url(#:R6c56sm:-gradient-dark-2)"
                                              , D.Stroke !:=
                                                  "url(#:R6c56sm:-gradient-dark-2)"
                                              ]
                                          )
                                          []
                                      ]
                                  ]
                              , D.h2
                                  ( D.Class !:=
                                      "mt-4 font-display text-base text-slate-900 dark:text-white"
                                  )
                                  [ D.a (D.Href !:= "/")
                                      [ D.span
                                          ( D.Class !:=
                                              "absolute -inset-px rounded-xl"
                                          )
                                          []
                                      , text_ "Plugins"
                                      ]
                                  ]
                              , D.p
                                  ( D.Class !:=
                                      "mt-1 text-sm text-slate-700 dark:text-slate-400"
                                  )
                                  [ text_
                                      "Extend the library with third-party plugins or write your own."
                                  ]
                              ]
                          ]
                      , D.div
                          ( D.Class !:=
                              "group relative rounded-xl border border-slate-200 dark:border-slate-800"
                          )
                          [ D.div
                              ( D.Class !:=
                                  "absolute -inset-px rounded-xl border-2 border-transparent opacity-0 [background:linear-gradient(var(--quick-links-hover-bg,theme(colors.sky.50)),var(--quick-links-hover-bg,theme(colors.sky.50)))_padding-box,linear-gradient(to_top,theme(colors.indigo.400),theme(colors.cyan.400),theme(colors.sky.500))_border-box] group-hover:opacity-100 dark:[--quick-links-hover-bg:theme(colors.slate.800)]"
                              )
                              []
                          , D.div
                              ( D.Class !:=
                                  "relative overflow-hidden rounded-xl p-6"
                              )
                              [ D.svg
                                  ( oneOf
                                      [ D.AriaHidden !:= "true"
                                      , D.ViewBox !:= "0 0 32 32"
                                      , D.Fill !:= "none"
                                      , D.Class !:=
                                          "h-8 w-8 [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"
                                      ]
                                  )
                                  [ D.defs_
                                      [ D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:= ":R6g56sm:-gradient"
                                              , D.GradientTransform !:=
                                                  "matrix(0 21 -21 0 12 11)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      , D.radialGradient
                                          ( oneOf
                                              [ D.Cx !:= "0"
                                              , D.Cy !:= "0"
                                              , D.R !:= "1"
                                              , D.GradientUnits !:=
                                                  "userSpaceOnUse"
                                              , D.Id !:=
                                                  ":R6g56sm:-gradient-dark"
                                              , D.GradientTransform !:=
                                                  "matrix(0 24.5 -24.5 0 16 5.5)"
                                              ]
                                          )
                                          [ D.stop (D.StopColor !:= "#0EA5E9")
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#22D3EE"
                                                  , D.Offset !:= ".527"
                                                  ]
                                              )
                                              []
                                          , D.stop
                                              ( oneOf
                                                  [ D.StopColor !:= "#818CF8"
                                                  , D.Offset !:= "1"
                                                  ]
                                              )
                                              []
                                          ]
                                      ]
                                  , D.g (D.Class !:= "dark:hidden")
                                      [ D.circle
                                          ( oneOf
                                              [ D.Cx !:= "12"
                                              , D.Cy !:= "20"
                                              , D.R !:= "12"
                                              , D.Fill !:=
                                                  "url(#:R6g56sm:-gradient)"
                                              ]
                                          )
                                          []
                                      , D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "M27 12.13 19.87 5 13 11.87v14.26l14-14Z"
                                              , D.Class !:=
                                                  "fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]"
                                              , D.FillOpacity !:= "0.5"
                                              , D.StrokeWidth !:= "2"
                                              , D.StrokeLinecap !:= "round"
                                              , D.StrokeLinejoin !:= "round"
                                              ]
                                          )
                                          []
                                      , D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "M3 3h10v22a4 4 0 0 1-4 4H7a4 4 0 0 1-4-4V3Z"
                                              , D.Class !:=
                                                  "fill-[var(--icon-background)]"
                                              , D.FillOpacity !:= "0.5"
                                              ]
                                          )
                                          []
                                      , D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "M3 9v16a4 4 0 0 0 4 4h2a4 4 0 0 0 4-4V9M3 9V3h10v6M3 9h10M3 15h10M3 21h10"
                                              , D.Class !:=
                                                  "stroke-[color:var(--icon-foreground)]"
                                              , D.StrokeWidth !:= "2"
                                              , D.StrokeLinecap !:= "round"
                                              , D.StrokeLinejoin !:= "round"
                                              ]
                                          )
                                          []
                                      , D.path
                                          ( oneOf
                                              [ D.D !:=
                                                  "M29 29V19h-8.5L13 26c0 1.5-2.5 3-5 3h21Z"
                                              , D.FillOpacity !:= "0.5"
                                              , D.Class !:=
                                                  "fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]"
                                              , D.StrokeWidth !:= "2"
                                              , D.StrokeLinecap !:= "round"
                                              , D.StrokeLinejoin !:= "round"
                                              ]
                                          )
                                          []
                                      ]
                                  , D.g (D.Class !:= "hidden dark:inline")
                                      [ D.path
                                          ( oneOf
                                              [ D.FillRule !:= "evenodd"
                                              , D.ClipRule !:= "evenodd"
                                              , D.D !:=
                                                  "M3 2a1 1 0 0 0-1 1v21a6 6 0 0 0 12 0V3a1 1 0 0 0-1-1H3Zm16.752 3.293a1 1 0 0 0-1.593.244l-1.045 2A1 1 0 0 0 17 8v13a1 1 0 0 0 1.71.705l7.999-8.045a1 1 0 0 0-.002-1.412l-6.955-6.955ZM26 18a1 1 0 0 0-.707.293l-10 10A1 1 0 0 0 16 30h13a1 1 0 0 0 1-1V19a1 1 0 0 0-1-1h-3ZM5 18a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2H5Zm-1-5a1 1 0 0 1 1-1h6a1 1 0 1 1 0 2H5a1 1 0 0 1-1-1Zm1-7a1 1 0 0 0 0 2h6a1 1 0 1 0 0-2H5Z"
                                              , D.Fill !:=
                                                  "url(#:R6g56sm:-gradient-dark)"
                                              ]
                                          )
                                          []
                                      ]
                                  ]
                              , D.h2
                                  ( D.Class !:=
                                      "mt-4 font-display text-base text-slate-900 dark:text-white"
                                  )
                                  [ D.a (D.Href !:= "/")
                                      [ D.span
                                          ( D.Class !:=
                                              "absolute -inset-px rounded-xl"
                                          )
                                          []
                                      , text_ "API reference"
                                      ]
                                  ]
                              , D.p
                                  ( D.Class !:=
                                      "mt-1 text-sm text-slate-700 dark:text-slate-400"
                                  )
                                  [ text_
                                      "Learn to easily customize and modify your app's visual design to fit your brand."
                                  ]
                              ]
                          ]
                      ]
                  , D.p_
                      [ text_
                          "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste."
                      ]
                  , D.hr_ []
                  , D.h2 (D.Id !:= "quick-start") [ text_ "Quick start" ]
                  , D.p_
                      [ text_
                          "Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur."
                      ]
                  , D.h3 (D.Id !:= "installing-dependencies")
                      [ text_ "Installing dependencies" ]
                  , D.p_
                      [ text_
                          "Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur quaerat exercitationem. Consequatur et cum atque mollitia qui quia necessitatibus."
                      ]
                  , D.pre (D.Class !:= "prism-code language-shell")
                      [ D.code_
                          [ D.span (D.Class !:= "token function")
                              [ text_ "npm" ]
                          , D.span (D.Class !:= "token plain") []
                          , D.span (D.Class !:= "token function")
                              [ text_ "install" ]
                          , D.span (D.Class !:= "token plain")
                              [ text_ " @tailwindlabs/cache-advance" ]
                          ]
                      ]
                  , D.p_
                      [ text_
                          "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste. Provident nam asperiores vel laboriosam omnis ducimus enim nesciunt quaerat. Minus tempora cupiditate est quod."
                      ]
                  , disclaimer
                      { header: text_ "Oh no! Something bad happened!"
                      , message: D.p_
                          [ text_
                              "This is what a disclaimer message looks like. You might want to include inline "
                          , D.code_ [ text_ "code" ]
                          , text_
                              " in it. Or maybe you’ll want to include a "
                          , D.a (D.Href !:= "/") [ text_ "link" ]
                          , text_
                              " in it. I don’t think we should get too carried away with other scenarios like lists or tables — that would be silly."
                          ]
                      }
                  , D.h3 (D.Id !:= "configuring-the-library")
                      [ text_ "Configuring the library" ]
                  , D.p_
                      [ text_
                          "Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur quaerat exercitationem. Consequatur et cum atque mollitia qui quia necessitatibus."
                      ]
                  , D.pre (D.Class !:= "prism-code language-js")
                      [ D.code_
                          [ text_
                              """// cache-advance.config.js
export default {
  strategy: 'predictive',
  engine: {
    cpus: 12,
    backups: ['./storage/cache.wtf'],
  },
}"""
                          ]
                      ]
                  , D.p_
                      [ text_
                          "Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste. Provident nam asperiores vel laboriosam omnis ducimus enim nesciunt quaerat. Minus tempora cupiditate est quod."
                      ]
                  , proTip
                      { header: text_ "You should know!"
                      , message: D.p_
                          [ text_
                              "This is what a disclaimer message looks like. You might want to include inline "
                          , D.code_ [ text_ "code" ]
                          , text_
                              " in it. Or maybe you’ll want to include a "
                          , D.a (D.Href !:= "/") [ text_ "link" ]
                          , text_
                              " in it. I don’t think we should get too carried away with other scenarios like lists or tables — that would be silly."
                          ]
                      }
                  , D.hr_ []
                  , D.h2 (D.Id !:= "basic-usage") [ text_ "Basic usage" ]
                  , D.p_
                      [ text_
                          "Praesentium laudantium magni. Consequatur reiciendis aliquid nihil iusto ut in et. Quisquam ut et aliquid occaecati. Culpa veniam aut et voluptates amet perspiciatis. Qui exercitationem in qui. Vel qui dignissimos sit quae distinctio."
                      ]
                  , D.h3 (D.Id !:= "your-first-cache")
                      [ text_ "Your first cache" ]
                  , D.p_
                      [ text_
                          "Minima vel non iste debitis. Consequatur repudiandae et quod accusamus sit molestias consequatur aperiam. Et sequi ipsa eum voluptatibus ipsam. Et quisquam ut."
                      ]
                  , D.p_
                      [ text_
                          "Qui quae esse aspernatur fugit possimus. Quam sed molestiae temporibus. Eum perferendis dignissimos provident ea et. Et repudiandae quasi accusamus consequatur dolore nobis. Quia reiciendis necessitatibus a blanditiis iste quia. Ut quis et amet praesentium sapiente."
                      ]
                  , D.p_
                      [ text_
                          "Atque eos laudantium. Optio odit aspernatur consequuntur corporis soluta quidem sunt aut doloribus. Laudantium assumenda commodi."
                      ]
                  , D.h3 (D.Id !:= "clearing-the-cache")
                      [ text_ "Clearing the cache" ]
                  , D.p_
                      [ text_
                          "Vel aut velit sit dolor aut suscipit at veritatis voluptas. Laudantium tempore praesentium. Qui ut voluptatem."
                      ]
                  , D.p_
                      [ text_
                          "Ea est autem fugiat velit esse a alias earum. Dolore non amet soluta eos libero est. Consequatur qui aliquam qui odit eligendi ut impedit illo dignissimos."
                      ]
                  , D.p_
                      [ text_
                          "Ut dolore qui aut nam. Natus temporibus nisi voluptatum labore est ex error vel officia. Vero repellendus ut. Suscipit voluptate et placeat. Eius quo corporis ab et consequatur quisquam. Nihil officia facere dolorem occaecati alias deleniti deleniti in."
                      ]
                  , D.h3 (D.Id !:= "adding-middleware")
                      [ text_ "Adding middleware" ]
                  , D.p_
                      [ text_
                          "Officia nobis tempora maiores id iusto magni reprehenderit velit. Quae dolores inventore molestiae perspiciatis aut. Quis sequi officia quasi rem officiis officiis. Nesciunt ut cupiditate. Sunt aliquid explicabo enim ipsa eum recusandae. Vitae sunt eligendi et non beatae minima aut."
                      ]
                  , D.p_
                      [ text_
                          "Harum perferendis aut qui quibusdam tempore laboriosam voluptatum qui sed. Amet error amet totam exercitationem aut corporis accusantium dolorum. Perspiciatis aut animi et. Sed unde error ut aut rerum."
                      ]
                  , D.p_
                      [ text_
                          "Ut quo libero aperiam mollitia est repudiandae quaerat corrupti explicabo. Voluptas accusantium sed et doloribus voluptatem fugiat a mollitia. Numquam est magnam dolorem asperiores fugiat. Soluta et fuga amet alias temporibus quasi velit. Laudantium voluptatum perspiciatis doloribus quasi facere. Eveniet deleniti veniam et quia veritatis minus veniam perspiciatis."
                      ]
                  , D.hr_ []
                  , D.h2 (D.Id !:= "getting-help") [ text_ "Getting help" ]
                  , D.p_
                      [ text_
                          "Consequuntur et aut quisquam et qui consequatur eligendi. Necessitatibus dolorem sit. Excepturi cumque quibusdam soluta ullam rerum voluptatibus. Porro illo sequi consequatur nisi numquam nisi autem. Ut necessitatibus aut. Veniam ipsa voluptatem sed."
                      ]
                  , D.h3 (D.Id !:= "submit-an-issue")
                      [ text_ "Submit an issue" ]
                  , D.p_
                      [ text_
                          "Inventore et aut minus ut voluptatem nihil commodi doloribus consequatur. Facilis perferendis nihil sit aut aspernatur iure ut dolores et. Aspernatur odit dignissimos. Aut qui est sint sint."
                      ]
                  , D.p_
                      [ text_
                          "Facere aliquam qui. Dolorem officia ipsam adipisci qui molestiae. Error voluptatem reprehenderit ex."
                      ]
                  , D.p_
                      [ text_
                          "Consequatur enim quia maiores aperiam et ipsum dicta. Quam ut sit facere sit quae. Eligendi veritatis aut ut veritatis iste ut adipisci illo."
                      ]
                  , D.h3 (D.Id !:= "join-the-community")
                      [ text_ "Join the community" ]
                  , D.p_
                      [ text_
                          "Praesentium facilis iste aliquid quo quia a excepturi. Fuga reprehenderit illo sequi voluptatem voluptatem omnis. Id quia consequatur rerum consectetur eligendi et omnis. Voluptates iusto labore possimus provident praesentium id vel harum quisquam. Voluptatem provident corrupti."
                      ]
                  , D.p_
                      [ text_
                          "Eum et ut. Qui facilis est ipsa. Non facere quia sequi commodi autem. Dicta autem sit sequi omnis impedit. Eligendi amet dolorum magnam repudiandae in a."
                      ]
                  , D.p_
                      [ text_
                          "Molestiae iusto ut exercitationem dolorem unde iusto tempora atque nihil. Voluptatem velit facere laboriosam nobis ea. Consequatur rerum velit ipsum ipsam. Et qui saepe consequatur minima laborum tempore voluptatum et. Quia eveniet eaque sequi consequatur nihil eos."
                      ]
                  ]
              ]
          , bottomNav { link: "/docs/installation", title: "Installation" }
          ]
      , D.div
          ( D.Class !:=
              "hidden xl:sticky xl:top-[4.5rem] xl:-mr-6 xl:block xl:h-[calc(100vh-4.5rem)] xl:flex-none xl:overflow-y-auto xl:py-16 xl:pr-6"
          )
          [ D.nav
              ( oneOf
                  [ -- D.AriaLabelledby !:= "on-this-page-title",
                    D.Class !:= "w-56"
                  ]
              )
              [ D.h2
                  ( oneOf
                      [ D.Id !:= "on-this-page-title"
                      , D.Class !:=
                          "font-display text-sm font-medium text-slate-900 dark:text-white"
                      ]
                  )
                  [ text_ "On this page" ]
              , D.ol
                  ( oneOf
                      [ D.Role !:= "list"
                      , D.Class !:= "mt-4 space-y-3 text-sm"
                      ]
                  )
                  [ D.li_
                      [ D.h3_
                          [ D.a
                              ( oneOf
                                  [ D.Class !:= "text-sky-500"
                                  , D.Href !:= "/#quick-start"
                                  ]
                              )
                              [ text_ "Quick start" ]
                          ]
                      , D.ol
                          ( oneOf
                              [ D.Role !:= "list"
                              , D.Class !:=
                                  "mt-2 space-y-3 pl-5 text-slate-500 dark:text-slate-400"
                              ]
                          )
                          [ D.li_
                              [ D.a
                                  ( oneOf
                                      [ D.Class !:=
                                          "hover:text-slate-600 dark:hover:text-slate-300"
                                      , D.Href !:= "/#installing-dependencies"
                                      ]
                                  )
                                  [ text_ "Installing dependencies" ]
                              ]
                          , D.li_
                              [ D.a
                                  ( oneOf
                                      [ D.Class !:=
                                          "hover:text-slate-600 dark:hover:text-slate-300"
                                      , D.Href !:= "/#configuring-the-library"
                                      ]
                                  )
                                  [ text_ "Configuring the library" ]
                              ]
                          ]
                      ]
                  , D.li_
                      [ D.h3_
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "font-normal text-slate-500 hover:text-slate-700 dark:text-slate-400 dark:hover:text-slate-300"
                                  , D.Href !:= "/#basic-usage"
                                  ]
                              )
                              [ text_ "Basic usage" ]
                          ]
                      , D.ol
                          ( oneOf
                              [ D.Role !:= "list"
                              , D.Class !:=
                                  "mt-2 space-y-3 pl-5 text-slate-500 dark:text-slate-400"
                              ]
                          )
                          [ D.li_
                              [ D.a
                                  ( oneOf
                                      [ D.Class !:=
                                          "hover:text-slate-600 dark:hover:text-slate-300"
                                      , D.Href !:= "/#your-first-cache"
                                      ]
                                  )
                                  [ text_ "Your first cache" ]
                              ]
                          , D.li_
                              [ D.a
                                  ( oneOf
                                      [ D.Class !:=
                                          "hover:text-slate-600 dark:hover:text-slate-300"
                                      , D.Href !:= "/#clearing-the-cache"
                                      ]
                                  )
                                  [ text_ "Clearing the cache" ]
                              ]
                          , D.li_
                              [ D.a
                                  ( oneOf
                                      [ D.Class !:=
                                          "hover:text-slate-600 dark:hover:text-slate-300"
                                      , D.Href !:= "/#adding-middleware"
                                      ]
                                  )
                                  [ text_ "Adding middleware" ]
                              ]
                          ]
                      ]
                  , D.li_
                      [ D.h3_
                          [ D.a
                              ( oneOf
                                  [ D.Class !:=
                                      "font-normal text-slate-500 hover:text-slate-700 dark:text-slate-400 dark:hover:text-slate-300"
                                  , D.Href !:= "/#getting-help"
                                  ]
                              )
                              [ text_ "Getting help" ]
                          ]
                      , D.ol
                          ( oneOf
                              [ D.Role !:= "list"
                              , D.Class !:=
                                  "mt-2 space-y-3 pl-5 text-slate-500 dark:text-slate-400"
                              ]
                          )
                          [ D.li_
                              [ D.a
                                  ( oneOf
                                      [ D.Class !:=
                                          "hover:text-slate-600 dark:hover:text-slate-300"
                                      , D.Href !:= "/#submit-an-issue"
                                      ]
                                  )
                                  [ text_ "Submit an issue" ]
                              ]
                          , D.li_
                              [ D.a
                                  ( oneOf
                                      [ D.Class !:=
                                          "hover:text-slate-600 dark:hover:text-slate-300"
                                      , D.Href !:= "/#join-the-community"
                                      ]
                                  )
                                  [ text_ "Join the community" ]
                              ]
                          ]
                      ]
                  ]
              ]
          ]
      ]
  ]