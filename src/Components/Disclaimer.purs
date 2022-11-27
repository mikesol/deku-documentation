module Components.Disclaimer where

import Prelude

import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Core (Domable)
import Deku.DOM as D

disclaimer
  :: forall lock payload
   . { header :: Domable lock payload, message :: Domable lock payload }
  -> Domable lock payload
disclaimer { header, message } = D.div
  ( D.Class !:=
      "my-8 flex rounded-3xl p-6 bg-amber-50 dark:bg-slate-800/60 dark:ring-1 dark:ring-slate-300/10"
  )
  [ D.svg
      ( oneOf
          [ D.AriaHidden !:= "true"
          , D.ViewBox !:= "0 0 32 32"
          , D.Fill !:= "none"
          , D.Class !:=
              "h-8 w-8 flex-none [--icon-foreground:theme(colors.amber.900)] [--icon-background:theme(colors.amber.100)]"
          ]
      )
      [ D.defs_
          [ D.radialGradient
              ( oneOf
                  [ D.Cx !:= "0"
                  , D.Cy !:= "0"
                  , D.R !:= "1"
                  , D.GradientUnits !:= "userSpaceOnUse"
                  , D.Id !:= ":R4n6sm:-gradient"
                  , D.GradientTransform !:=
                      "rotate(65.924 1.519 20.92) scale(25.7391)"
                  ]
              )
              [ D.stop
                  ( oneOf
                      [ D.StopColor !:= "#FDE68A"
                      , D.Offset !:= ".08"
                      ]
                  )
                  []
              , D.stop
                  ( oneOf
                      [ D.StopColor !:= "#F59E0B"
                      , D.Offset !:= ".837"
                      ]
                  )
                  []
              ]
          , D.radialGradient
              ( oneOf
                  [ D.Cx !:= "0"
                  , D.Cy !:= "0"
                  , D.R !:= "1"
                  , D.GradientUnits !:= "userSpaceOnUse"
                  , D.Id !:= ":R4n6sm:-gradient-dark"
                  , D.GradientTransform !:=
                      "matrix(0 24.5 -24.5 0 16 5.5)"
                  ]
              )
              [ D.stop
                  ( oneOf
                      [ D.StopColor !:= "#FDE68A"
                      , D.Offset !:= ".08"
                      ]
                  )
                  []
              , D.stop
                  ( oneOf
                      [ D.StopColor !:= "#F59E0B"
                      , D.Offset !:= ".837"
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
                  , D.Fill !:= "url(#:R4n6sm:-gradient)"
                  ]
              )
              []
          , D.path
              ( oneOf
                  [ D.D !:=
                      "M3 16c0 7.18 5.82 13 13 13s13-5.82 13-13S23.18 3 16 3 3 8.82 3 16Z"
                  , D.FillOpacity !:= "0.5"
                  , D.Class !:=
                      "fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]"
                  , D.StrokeWidth !:= "2"
                  , D.StrokeLinecap !:= "round"
                  , D.StrokeLinejoin !:= "round"
                  ]
              )
              []
          , D.path
              ( oneOf
                  [ D.D !:=
                      "m15.408 16.509-1.04-5.543a1.66 1.66 0 1 1 3.263 0l-1.039 5.543a.602.602 0 0 1-1.184 0Z"
                  , D.Class !:=
                      "fill-[var(--icon-foreground)] stroke-[color:var(--icon-foreground)]"
                  , D.StrokeWidth !:= "2"
                  , D.StrokeLinecap !:= "round"
                  , D.StrokeLinejoin !:= "round"
                  ]
              )
              []
          , D.path
              ( oneOf
                  [ D.D !:=
                      "M16 23a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"
                  , D.FillOpacity !:= "0.5"
                  , D.Stroke !:= "currentColor"
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
                      "M2 16C2 8.268 8.268 2 16 2s14 6.268 14 14-6.268 14-14 14S2 23.732 2 16Zm11.386-4.85a2.66 2.66 0 1 1 5.228 0l-1.039 5.543a1.602 1.602 0 0 1-3.15 0l-1.04-5.543ZM16 20a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z"
                  , D.Fill !:=
                      "url(#:R4n6sm:-gradient-dark)"
                  ]
              )
              []
          ]
      ]
  , D.div (D.Class !:= "ml-4 flex-auto")
      [ D.p
          ( D.Class !:=
              "m-0 font-display text-xl text-amber-900 dark:text-amber-500"
          )
          [ header ]
      , D.div
          ( D.Class !:=
              "prose mt-2.5 text-amber-800 [--tw-prose-underline:theme(colors.amber.400)] [--tw-prose-background:theme(colors.amber.50)] prose-a:text-amber-900 prose-code:text-amber-900 dark:text-slate-300 dark:[--tw-prose-underline:theme(colors.sky.700)] dark:prose-code:text-slate-300"
          )
          [ message
          ]
      ]
  ]

