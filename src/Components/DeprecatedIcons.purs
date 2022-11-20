module Components.DeprecatedIcons where

import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D

deprecatedIcons :: Nut
deprecatedIcons = D.div
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