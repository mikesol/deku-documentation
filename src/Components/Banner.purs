module Components.Banner where

import Prelude

import Assets (blurCyanURL, blurIndigoURL)
import Control.Alt ((<|>))
import Data.Monoid (guard)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (Attribute, xdata)
import Deku.Control (text_)
import Deku.Core (Nut, attributeAtYourOwnRisk)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.DOM.SVG as DS
import Deku.DOM.SVG.Attributes as DSA
import Deku.Do as Deku
import Deku.Hooks (useRant, useState', (<#~>))
import Effect (Effect)
import FRP.Dedup (dedup)
import FRP.Poll (Poll)
import Prism (forceHighlight)

foreign import addConfetti :: Effect Unit

data BannerExample = CodeExample | ButtonExample

derive instance Eq BannerExample

bannerExampleOuterSelected :: String
bannerExampleOuterSelected =
  "cursor-pointer flex h-6 rounded-full bg-gradient-to-r from-sky-400/30 via-sky-400 to-sky-400/30 p-px font-medium text-sky-300"

bannerExampleInnerSelected :: String
bannerExampleInnerSelected =
  "flex items-center rounded-full px-2.5 bg-slate-800"

bannerExampleOuterNotSelected :: String
bannerExampleOuterNotSelected =
  "cursor-pointer flex h-6 rounded-full text-slate-500"

bannerExampleInnerNotSelected :: String
bannerExampleInnerNotSelected = "flex items-center rounded-full px-2.5"

transform_ :: forall f4 e7. Applicative f4 => String -> f4 (Attribute e7)
transform_ v = pure (attributeAtYourOwnRisk "transform" v)

banner
  :: { showBanner :: Poll Boolean }
  -> Nut
banner { showBanner } = D.div
  [ DA.klass $ showBanner <#> not >>> flip guard "hidden " >>>
      ( _ <>
          "overflow-hidden bg-slate-900 dark:-mb-32 dark:mt-[-4.5rem] dark:pb-32 dark:pt-[4.5rem] dark:lg:mt-[-4.75rem] dark:lg:pt-[4.75rem]"
      )
  ]
  [ D.div [ DA.klass_ "py-16 sm:px-2 lg:relative lg:py-20 lg:px-0" ]
      [ D.div
          [ DA.klass_
              "mx-auto grid max-w-2xl grid-cols-1 items-center gap-y-16 gap-x-8 px-4 lg:max-w-8xl lg:grid-cols-2 lg:px-8 xl:gap-x-16 xl:px-12"
          ]
          [ D.div [ DA.klass_ "relative z-10 md:text-center lg:text-left" ]
              [ D.img
                  [ DA.alt_ ""
                  , DA.src_ blurCyanURL
                  , DA.width_ "530"
                  , DA.height_ "530"
                  , DA.decoding_ "async"
                  , pure (xdata "nimg" "1")
                  , DA.klass_
                      "absolute bottom-full right-full -mr-72 -mb-56 opacity-50"
                  , DA.style_ "color:transparent"
                  ]
                  []
              , D.div [ DA.klass_ "relative" ]
                  [ D.p
                      [ DA.klass_
                          "inline bg-gradient-to-r from-indigo-200 via-sky-400 to-indigo-200 bg-clip-text font-display text-5xl tracking-tight text-transparent"
                      ]
                      [ text_ "Introducing Deku." ]
                  , D.p
                      [ DA.klass_
                          "mt-3 text-2xl tracking-tight text-slate-400"
                      ]
                      [ text_
                          "A PureScript UI framework for building reactive games and web apps."
                      ]
                  , D.div
                      [ DA.klass_
                          "mt-8 flex gap-4 md:justify-center lg:justify-start"
                      ]
                      [ D.a
                          [ DA.klass_
                              "rounded-full bg-sky-300 py-2 px-4 text-sm font-semibold text-slate-900 hover:bg-sky-200 focus:outline-none focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-300/50 active:bg-sky-500"
                          , DA.href_ "/#getting-started"
                          ]
                          [ text_ "Get started" ]
                      , D.a
                          [ DA.target_ "_blank"
                          , DA.klass_
                              "rounded-full bg-slate-800 py-2 px-4 text-sm font-medium text-white hover:bg-slate-700 focus:outline-none focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white/50 active:text-slate-400"
                          , DA.href_
                              "https://github.com/mikesol/purescript-deku"
                          ]
                          [ text_ "View on GitHub" ]
                      ]
                  ]
              ]
          , D.div [ DA.klass_ "relative lg:static xl:pl-10" ]
              [ D.div
                  [ DA.klass_
                      "absolute inset-x-[-50vw] -top-32 -bottom-48 [mask-image:linear-gradient(transparent,white,white)] dark:[mask-image:linear-gradient(transparent,white,transparent)] lg:left-[calc(50%+14rem)] lg:right-0 lg:-top-32 lg:-bottom-32 lg:[mask-image:none] lg:dark:[mask-image:linear-gradient(white,white,transparent)]"
                  ]
                  [ DS.svg
                      [ DSA.viewBox_ "0 0 668 1069"
                      , DSA.width_ "668"
                      , DSA.height_ "1069"
                      , DSA.fill_ "none"
                      , DSA.klass_
                          "absolute top-1/2 left-1/2 -translate-y-1/2 -translate-x-1/2 lg:left-0 lg:translate-x-0 lg:translate-y-[-60%]"
                      ]

                      [ DS.defs_
                          [ DS.clipPath [ DA.id_ ":R6km:-clip-path" ]
                              [ DS.path
                                  [ DSA.fill_ "#fff"
                                  , transform_ "rotate(-180 334 534.4)"
                                  , DSA.d_ "M0 0h668v1068.8H0z"
                                  ]
                                  []
                              ]
                          ]
                      , DS.g
                          [ pure (attributeAtYourOwnRisk "opacity" ".4")
                          , pure
                              ( attributeAtYourOwnRisk "clip-path"
                                  "url(#:R6km:-clip-path)"

                              )
                          , DSA.strokeWidth_ "4"
                          ]
                          [ DS.path
                              [ pure
                                  ( attributeAtYourOwnRisk
                                    "opacity" ".3"
                                  )
                              , DSA.d_
                                  "M584.5 770.4v-474M484.5 770.4v-474M384.5 770.4v-474M283.5 769.4v-474M183.5 768.4v-474M83.5 767.4v-474"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.path
                              [ DSA.d_
                                  "M83.5 221.275v6.587a50.1 50.1 0 0 0 22.309 41.686l55.581 37.054a50.102 50.102 0 0 1 22.309 41.686v6.587M83.5 716.012v6.588a50.099 50.099 0 0 0 22.309 41.685l55.581 37.054a50.102 50.102 0 0 1 22.309 41.686v6.587M183.7 584.5v6.587a50.1 50.1 0 0 0 22.31 41.686l55.581 37.054a50.097 50.097 0 0 1 22.309 41.685v6.588M384.101 277.637v6.588a50.1 50.1 0 0 0 22.309 41.685l55.581 37.054a50.1 50.1 0 0 1 22.31 41.686v6.587M384.1 770.288v6.587a50.1 50.1 0 0 1-22.309 41.686l-55.581 37.054A50.099 50.099 0 0 0 283.9 897.3v6.588"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.path
                              [ DSA.d_
                                  "M384.1 770.288v6.587a50.1 50.1 0 0 1-22.309 41.686l-55.581 37.054A50.099 50.099 0 0 0 283.9 897.3v6.588M484.3 594.937v6.587a50.1 50.1 0 0 1-22.31 41.686l-55.581 37.054A50.1 50.1 0 0 0 384.1 721.95v6.587M484.3 872.575v6.587a50.1 50.1 0 0 1-22.31 41.686l-55.581 37.054a50.098 50.098 0 0 0-22.309 41.686v6.582M584.501 663.824v39.988a50.099 50.099 0 0 1-22.31 41.685l-55.581 37.054a50.102 50.102 0 0 0-22.309 41.686v6.587M283.899 945.637v6.588a50.1 50.1 0 0 1-22.309 41.685l-55.581 37.05a50.12 50.12 0 0 0-22.31 41.69v6.59M384.1 277.637c0 19.946 12.763 37.655 31.686 43.962l137.028 45.676c18.923 6.308 31.686 24.016 31.686 43.962M183.7 463.425v30.69c0 21.564 13.799 40.709 34.257 47.529l134.457 44.819c18.922 6.307 31.686 24.016 31.686 43.962M83.5 102.288c0 19.515 13.554 36.412 32.604 40.645l235.391 52.309c19.05 4.234 32.605 21.13 32.605 40.646M83.5 463.425v-58.45M183.699 542.75V396.625M283.9 1068.8V945.637M83.5 363.225v-141.95M83.5 179.524v-77.237M83.5 60.537V0M384.1 630.425V277.637M484.301 830.824V594.937M584.5 1068.8V663.825M484.301 555.275V452.988M584.5 622.075V452.988M384.1 728.537v-56.362M384.1 1068.8v-20.88M384.1 1006.17V770.287M283.9 903.888V759.85M183.699 1066.71V891.362M83.5 1068.8V716.012M83.5 674.263V505.175"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.circle
                              [ DSA.cx_ "83.5"
                              , DSA.cy_ "384.1"
                              , DSA.r_ "10.438"
                              , transform_
                                  "rotate(-180 83.5 384.1)"
                              , DSA.fill_ "#1E293B"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.circle
                              [ DSA.cx_ "83.5"
                              , DSA.cy_ "200.399"
                              , DSA.r_ "10.438"
                              , transform_
                                  "rotate(-180 83.5 200.399)"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.circle
                              [ DSA.cx_ "83.5"
                              , DSA.cy_ "81.412"
                              , DSA.r_ "10.438"
                              , transform_
                                  "rotate(-180 83.5 81.412)"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.circle
                              [ DSA.cx_ "183.699"
                              , DSA.cy_ "375.75"
                              , DSA.r_ "10.438"
                              , transform_
                                  "rotate(-180 183.699 375.75)"
                              , DSA.fill_ "#1E293B"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.circle
                              [ DSA.cx_ "183.699"
                              , DSA.cy_ "563.625"
                              , DSA.r_ "10.438"
                              , transform_
                                  "rotate(-180 183.699 563.625)"
                              , DSA.fill_ "#1E293B"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.circle
                              [ DSA.cx_ "384.1"
                              , DSA.cy_ "651.3"
                              , DSA.r_ "10.438"
                              , transform_
                                  "rotate(-180 384.1 651.3)"
                              , DSA.fill_ "#1E293B"
                              , DSA.stroke_ "#334155"
                              ]
                              []
                          , DS.circle
                              [ DSA.cx_ "484.301"
                              , DSA.cy_ "574.062"
                              , DSA.r_ "10.438"
                              , transform_
                                  "rotate(-180 484.301 574.062)"
                              , DSA.fill_ "#0EA5E9"
                              , DSA.fillOpacity_ ".42"
                              , DSA.stroke_ "#0EA5E9"
                              ]
                              []
                          , DS.circle
                              ( [ DSA.cx_ "384.1"
                                , DSA.cy_ "749.412"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 384.1 749.412)"
                                , DSA.fill_ "#1E293B"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "384.1"
                                , DSA.cy_ "1027.05"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 384.1 1027.05)"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "283.9"
                                , DSA.cy_ "924.763"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 283.9 924.763)"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "183.699"
                                , DSA.cy_ "870.487"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 183.699 870.487)"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "283.9"
                                , DSA.cy_ "738.975"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 283.9 738.975)"
                                , DSA.fill_ "#1E293B"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "83.5"
                                , DSA.cy_ "695.138"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 83.5 695.138)"
                                , DSA.fill_ "#1E293B"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "83.5"
                                , DSA.cy_ "484.3"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 83.5 484.3)"
                                , DSA.fill_ "#0EA5E9"
                                , DSA.fillOpacity_ ".42"
                                , DSA.stroke_ "#0EA5E9"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "484.301"
                                , DSA.cy_ "432.112"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 484.301 432.112)"
                                , DSA.fill_ "#1E293B"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "584.5"
                                , DSA.cy_ "432.112"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 584.5 432.112)"
                                , DSA.fill_ "#1E293B"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "584.5"
                                , DSA.cy_ "642.95"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 584.5 642.95)"
                                , DSA.fill_ "#1E293B"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "484.301"
                                , DSA.cy_ "851.699"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 484.301 851.699)"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          , DS.circle
                              ( [ DSA.cx_ "384.1"
                                , DSA.cy_ "256.763"
                                , DSA.r_ "10.438"
                                , transform_
                                    "rotate(-180 384.1 256.763)"
                                , DSA.stroke_ "#334155"
                                ]
                              )
                              []
                          ]
                      ]
                  ]
              , D.div [ DA.klass_ "relative" ]
                  [ D.img
                      ( [ DA.alt_ ""
                        , DA.src_ blurCyanURL
                        , DA.width_ "530"
                        , DA.height_ "530"
                        , DA.decoding_ "async"
                        , pure $ xdata "nimg" "1"
                        , DA.klass_ "absolute -top-64 -right-64"
                        , DA.style_ "color:transparent"
                        ]
                      )
                      []
                  , D.img
                      ( [ DA.alt_ ""
                        , DA.src_ blurIndigoURL
                        , DA.width_ "567"
                        , DA.height_ "567"
                        , DA.decoding_ "async"
                        , pure $ xdata "nimg" "1"
                        , DA.klass_ "absolute -bottom-40 -right-44"
                        , DA.style_ "color:transparent"
                        ]
                      )
                      []
                  , D.div
                      [ DA.klass_
                          "absolute inset-0 rounded-2xl bg-gradient-to-tr from-sky-300 via-sky-300/70 to-blue-300 opacity-10 blur-lg"
                      ]
                      []
                  , D.div
                      [ DA.klass_
                          "absolute inset-0 rounded-2xl bg-gradient-to-tr from-sky-300 via-sky-300/70 to-blue-300 opacity-10"
                      ]
                      []
                  , D.div
                      [ DA.klass_
                          "relative rounded-2xl bg-[#0A101F]/80 ring-1 ring-white/10 backdrop-blur"
                      ]
                      [ D.div
                          [ DA.klass_
                              "absolute -top-px left-20 right-11 h-px bg-gradient-to-r from-sky-300/0 via-sky-300/70 to-sky-300/0"
                          ]
                          []
                      , D.div
                          [ DA.klass_
                              "absolute -bottom-px left-11 right-20 h-px bg-gradient-to-r from-blue-400/0 via-blue-400 to-blue-400/0"
                          ]
                          []
                      , Deku.do
                          setBannerExample /\ bannerExample' <- useState'
                          bannerExample'' <- useRant
                            ( showBanner $> CodeExample <|> dedup
                                bannerExample'
                            )
                          let
                            bannerExample = pure CodeExample <|> bannerExample''
                          D.div [ DA.klass_ "pl-4 pt-4" ]
                            [ DS.svg
                                ( [ DSA.viewBox_ "0 0 42 10"
                                  , DSA.fill_ "none"
                                  , DA.klass_
                                      "h-2.5 w-auto stroke-slate-500/30"
                                  ]
                                )
                                [ DS.circle
                                    ( [ DSA.cx_ "5"
                                      , DSA.cy_ "5"
                                      , DSA.r_ "4.5"
                                      ]
                                    )
                                    []
                                , DS.circle
                                    ( [ DSA.cx_ "21"
                                      , DSA.cy_ "5"
                                      , DSA.r_ "4.5"
                                      ]
                                    )
                                    []
                                , DS.circle
                                    ( [ DSA.cx_ "37"
                                      , DSA.cy_ "5"
                                      , DSA.r_ "4.5"
                                      ]
                                    )
                                    []
                                ]
                            , D.div
                                [ DA.klass_ "mt-4 flex space-x-2 text-xs" ]
                                [ D.div
                                    [ DA.klass $ bannerExample <#> case _ of
                                        CodeExample ->
                                          bannerExampleOuterSelected
                                        ButtonExample ->
                                          bannerExampleOuterNotSelected
                                    ]
                                    [ D.div
                                        ( [ DA.klass $ bannerExample <#>
                                              case _ of
                                                CodeExample ->
                                                  bannerExampleInnerSelected
                                                ButtonExample ->
                                                  bannerExampleInnerNotSelected
                                          , DL.click_ \_ -> do
                                              setBannerExample CodeExample
                                          ]
                                        )
                                        [ text_ "MyButton.purs" ]
                                    ]
                                , D.div
                                    [ DA.klass $ bannerExample <#>
                                        case _ of
                                          ButtonExample ->
                                            bannerExampleOuterSelected
                                          CodeExample ->
                                            bannerExampleOuterNotSelected
                                    ]
                                    [ D.div
                                        ( [ DA.klass $ bannerExample <#>
                                              case _ of
                                                ButtonExample ->
                                                  bannerExampleInnerSelected
                                                CodeExample ->
                                                  bannerExampleInnerNotSelected
                                          , DL.click_ \_ -> do
                                              setBannerExample ButtonExample
                                          ]
                                        )
                                        [ text_ "Result" ]
                                    ]
                                ]
                            , bannerExample <#~> case _ of
                                ButtonExample -> D.div
                                  [ DA.klass_
                                      "mt-6 flex items-start px-1 text-sm"
                                  ]
                                  [ D.div
                                      ( [ --D.AriaHidden_ "true",
                                          DA.klass_
                                            "select-none border-r border-slate-300/5 pr-4 font-mono text-slate-600"
                                        ]
                                      )
                                      [ text_ ""
                                      , D.br_ []
                                      , text_ ""
                                      , D.br_ []
                                      , text_ ""
                                      , D.br_ []
                                      , text_ ""
                                      , D.br_ []
                                      , text_ ""
                                      , D.br_ []
                                      , text_ ""
                                      , D.br_ []
                                      -- , text_ ""
                                      -- , D.br_ []
                                      ]
                                  , D.div
                                      [ DA.klass_
                                          "flex flex-row justify-center w-full"
                                      ]
                                      [ D.button
                                          ( [ DA.klass_
                                                "mt-8 rounded-full bg-sky-300 py-2 px-4 text-sm font-semibold text-slate-900 hover:bg-sky-200 focus:outline-none focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-300/50 active:bg-sky-500"
                                            , DL.click_ \_ -> addConfetti
                                            ]
                                          )
                                          [ text_ "Click me" ]
                                      ]
                                  ]

                                CodeExample -> D.div
                                  [ DA.klass_
                                      "mt-6 flex items-start px-1 text-sm"
                                  ]
                                  [ D.div
                                      ( [ --D.AriaHidden_ "true",
                                          DA.klass_
                                            "select-none border-r border-slate-300/5 pr-4 font-mono text-slate-600"
                                        ]
                                      )
                                      [ text_ "01"
                                      , D.br_ []
                                      , text_ "02"
                                      , D.br_ []
                                      , text_ "03"
                                      , D.br_ []
                                      , text_ "04"
                                      , D.br_ []
                                      , text_ "05"
                                      , D.br_ []
                                      , text_ "06"
                                      , D.br_ []
                                      -- , text_ "07"
                                      -- , D.br_ []
                                      ]
                                  , D.pre
                                      ( [ DA.style_
                                            "background:none;padding:0em;margin:0em;"
                                        , DA.klass_
                                            "prism-code language-purescript flex overflow-x-auto pb-6"
                                        ]
                                      )
                                      [ D.code
                                          ( [ DA.klass_ "px-4"
                                            ]
                                          )
                                          [ text_
                                              """myButton :: Nut
myButton =
  D.button
    [ buttonStyle, confettiClick ]
    [ text_ "Click me" ]
"""
                                          ]
                                      ]
                                  , forceHighlight
                                  ]
                            ]
                      ]
                  ]
              ]
          ]
      ]
  ]