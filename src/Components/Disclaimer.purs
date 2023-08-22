module Components.Disclaimer where


import Prelude

import Deku.Attribute as Deku.Attribute
import Deku.Core (Nut)
import Deku.DOM (Attribute)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.SVG as DS
import Deku.DOM.SVG.Attributes as DSA

clipRule_ :: forall f4 e7. Applicative f4 => String -> f4 (Attribute e7)
clipRule_ v = pure
  ( Deku.Attribute.unsafeAttribute
      { key: "clip-rule"
      , value: Deku.Attribute.prop' v
      }
  )
disclaimer
  :: { header :: Nut, message :: Nut }
  -> Nut
disclaimer { header, message } = D.div
  [ DSA.klass_
      "my-8 flex rounded-3xl p-6 bg-amber-50 dark:bg-slate-800/60 dark:ring-1 dark:ring-slate-300/10"
  ]
  [ DS.svg
      [ DSA.viewBox_ "0 0 32 32"
      , DSA.fill_ "none"
      , DSA.klass_
          "h-8 w-8 flex-none [--icon-foreground:theme(colors.amber.900)] [--icon-background:theme(colors.amber.100)]"
      ]
      [ DS.defs_
          [ DS.radialGradient
              [ DSA.cx_ "0"
              , DSA.cy_ "0"
              , DSA.r_ "1"
              , DSA.gradientUnits_ "userSpaceOnUse"
              , DA.id_ ":R4n6sm:-gradient"
              , DSA.gradientTransform_
                  "rotate(65.924 1.519 20.92) scale(25.7391)"
              ]

              [ DS.stop
                  [ DSA.stopColor_ "#FDE68A"
                  , DSA.offset_ ".08"
                  ]

                  []
              , DS.stop
                  [ DSA.stopColor_ "#F59E0B"
                  , DSA.offset_ ".837"
                  ]

                  []
              ]
          , DS.radialGradient
              [ DSA.cx_ "0"
              , DSA.cy_ "0"
              , DSA.r_ "1"
              , DSA.gradientUnits_ "userSpaceOnUse"
              , DA.id_ ":R4n6sm:-gradient-dark"
              , DSA.gradientTransform_
                  "matrix(0 24.5 -24.5 0 16 5.5)"
              ]

              [ DS.stop
                  [ DSA.stopColor_ "#FDE68A"
                  , DSA.offset_ ".08"
                  ]
                  []
              , DS.stop
                  [ DSA.stopColor_ "#F59E0B"
                  , DSA.offset_ ".837"
                  ]
                  []
              ]
          ]
      , DS.g [ DSA.klass_ "dark:hidden" ]
          [ DS.circle
              [ DSA.cx_ "20"
              , DSA.cy_ "20"
              , DSA.r_ "12"
              , DSA.fill_ "url(#:R4n6sm:-gradient)"
              ]
              []
          , DS.path
              [ DSA.d_
                  "M3 16c0 7.18 5.82 13 13 13s13-5.82 13-13S23.18 3 16 3 3 8.82 3 16Z"
              , DSA.fillOpacity_ "0.5"
              , DSA.klass_
                  "fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]"
              , DSA.strokeWidth_ "2"
              , DSA.strokeLinecap_ "round"
              , DSA.strokeLinejoin_ "round"
              ]
              []
          , DS.path
              [ DSA.d_
                  "m15.408 16.509-1.04-5.543a1.66 1.66 0 1 1 3.263 0l-1.039 5.543a.602.602 0 0 1-1.184 0Z"
              , DSA.klass_
                  "fill-[var(--icon-foreground)] stroke-[color:var(--icon-foreground)]"
              , DSA.strokeWidth_ "2"
              , DSA.strokeLinecap_ "round"
              , DSA.strokeLinejoin_ "round"
              ]
              []
          , DS.path
              [ DSA.d_
                  "M16 23a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z"
              , DSA.fillOpacity_ "0.5"
              , DSA.stroke_ "currentColor"
              , DSA.klass_
                  "fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]"
              , DSA.strokeWidth_ "2"
              , DSA.strokeLinecap_ "round"
              , DSA.strokeLinejoin_ "round"
              ]

              []
          ]
      , DS.g [ DSA.klass_ "hidden dark:inline" ]
          [ DS.path
              [ DSA.fillRule_ "evenodd"
              , clipRule_ "evenodd"
              , DSA.d_
                  "M2 16C2 8.268 8.268 2 16 2s14 6.268 14 14-6.268 14-14 14S2 23.732 2 16Zm11.386-4.85a2.66 2.66 0 1 1 5.228 0l-1.039 5.543a1.602 1.602 0 0 1-3.15 0l-1.04-5.543ZM16 20a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z"
              , DSA.fill_
                  "url(#:R4n6sm:-gradient-dark)"
              ]

              []
          ]
      ]
  , D.div [ DSA.klass_ "ml-4 flex-auto" ]
      [ D.p
          [ DSA.klass_
              "m-0 font-display text-xl text-amber-900 dark:text-amber-500"
          ]
          [ header ]
      , D.div
          [ DSA.klass_
              "prose mt-2.5 text-amber-800 [--tw-prose-underline:theme(colors.amber.400)] [--tw-prose-background:theme(colors.amber.50)] prose-a:text-amber-900 prose-code:text-amber-900 dark:text-slate-300 dark:[--tw-prose-underline:theme(colors.sky.700)] dark:prose-code:text-slate-300"
          ]
          [ message
          ]
      ]
  ]