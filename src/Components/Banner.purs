module Components.Banner where

import Prelude

import Assets (blurCyanURL, blurIndigoURL)
import Control.Alt ((<|>))
import Data.Foldable (oneOf)
import Data.Monoid (guard)
import Data.Tuple.Nested ((/\))
import Deku.Attribute (xdata, (!:=))
import Deku.Attributes (klass, klass_)
import Deku.Control (switcher, text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Hooks (useMemoized, useState)
import Deku.Do as Deku
import Deku.Listeners (click_)
import Effect (Effect)
import FRP.Dedup (dedup)
import FRP.Event (Event)
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

banner
  :: { showBanner :: Event Boolean }
  -> Nut
banner { showBanner } = D.div
  ( klass $ showBanner <#> not >>> flip guard "hidden " >>>
      ( _ <>
          "overflow-hidden bg-slate-900 dark:-mb-32 dark:mt-[-4.5rem] dark:pb-32 dark:pt-[4.5rem] dark:lg:mt-[-4.75rem] dark:lg:pt-[4.75rem]"
      )
  )
  [ D.div (D.Class !:= "py-16 sm:px-2 lg:relative lg:py-20 lg:px-0")
      [ D.div
          ( D.Class !:=
              "mx-auto grid max-w-2xl grid-cols-1 items-center gap-y-16 gap-x-8 px-4 lg:max-w-8xl lg:grid-cols-2 lg:px-8 xl:gap-x-16 xl:px-12"
          )
          [ D.div (D.Class !:= "relative z-10 md:text-center lg:text-left")
              [ D.img
                  ( oneOf
                      [ D.Alt !:= ""
                      , D.Src !:= blurCyanURL
                      , D.Width !:= "530"
                      , D.Height !:= "530"
                      , D.Decoding !:= "async"
                      , pure (xdata "nimg" "1")
                      , D.Class !:=
                          "absolute bottom-full right-full -mr-72 -mb-56 opacity-50"
                      , D.Style !:= "color:transparent"
                      ]
                  )
                  []
              , D.div (D.Class !:= "relative")
                  [ D.p
                      ( D.Class !:=
                          "inline bg-gradient-to-r from-indigo-200 via-sky-400 to-indigo-200 bg-clip-text font-display text-5xl tracking-tight text-transparent"
                      )
                      [ text_ "Introducing Deku." ]
                  , D.p
                      ( D.Class !:=
                          "mt-3 text-2xl tracking-tight text-slate-400"
                      )
                      [ text_
                          "A PureScript UI framework for building reactive games and web apps."
                      ]
                  , D.div
                      ( D.Class !:=
                          "mt-8 flex gap-4 md:justify-center lg:justify-start"
                      )
                      [ D.a
                          ( oneOf
                              [ D.Class !:=
                                  "rounded-full bg-sky-300 py-2 px-4 text-sm font-semibold text-slate-900 hover:bg-sky-200 focus:outline-none focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-300/50 active:bg-sky-500"
                              , D.Href !:= "/#getting-started"
                              ]
                          )
                          [ text_ "Get started" ]
                      , D.a
                          ( oneOf
                              [ D.Target !:= "_blank"
                              , D.Class !:=
                                  "rounded-full bg-slate-800 py-2 px-4 text-sm font-medium text-white hover:bg-slate-700 focus:outline-none focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white/50 active:text-slate-400"
                              , D.Href !:=
                                  "https://github.com/mikesol/purescript-deku"
                              ]
                          )
                          [ text_ "View on GitHub" ]
                      ]
                  ]
              ]
          , D.div (D.Class !:= "relative lg:static xl:pl-10")
              [ D.div
                  ( D.Class !:=
                      "absolute inset-x-[-50vw] -top-32 -bottom-48 [mask-image:linear-gradient(transparent,white,white)] dark:[mask-image:linear-gradient(transparent,white,transparent)] lg:left-[calc(50%+14rem)] lg:right-0 lg:-top-32 lg:-bottom-32 lg:[mask-image:none] lg:dark:[mask-image:linear-gradient(white,white,transparent)]"
                  )
                  [ D.svg
                      ( oneOf
                          [ D.AriaHidden !:= "true"
                          , D.ViewBox !:= "0 0 668 1069"
                          , D.Width !:= "668"
                          , D.Height !:= "1069"
                          , D.Fill !:= "none"
                          , D.Class !:=
                              "absolute top-1/2 left-1/2 -translate-y-1/2 -translate-x-1/2 lg:left-0 lg:translate-x-0 lg:translate-y-[-60%]"
                          ]
                      )
                      [ D.defs_
                          [ D.clipPath (D.Id !:= ":R6km:-clip-path")
                              [ D.path
                                  ( oneOf
                                      [ D.Fill !:= "#fff"
                                      , D.Transform !:=
                                          "rotate(-180 334 534.4)"
                                      , D.D !:= "M0 0h668v1068.8H0z"
                                      ]
                                  )
                                  []
                              ]
                          ]
                      , D.g
                          ( oneOf
                              [ D.Opacity !:= ".4"
                              , D.ClipPath !:= "url(#:R6km:-clip-path)"
                              , D.StrokeWidth !:= "4"
                              ]
                          )
                          [ D.path
                              ( oneOf
                                  [ D.Opacity !:= ".3"
                                  , D.D !:=
                                      "M584.5 770.4v-474M484.5 770.4v-474M384.5 770.4v-474M283.5 769.4v-474M183.5 768.4v-474M83.5 767.4v-474"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.path
                              ( oneOf
                                  [ D.D !:=
                                      "M83.5 221.275v6.587a50.1 50.1 0 0 0 22.309 41.686l55.581 37.054a50.102 50.102 0 0 1 22.309 41.686v6.587M83.5 716.012v6.588a50.099 50.099 0 0 0 22.309 41.685l55.581 37.054a50.102 50.102 0 0 1 22.309 41.686v6.587M183.7 584.5v6.587a50.1 50.1 0 0 0 22.31 41.686l55.581 37.054a50.097 50.097 0 0 1 22.309 41.685v6.588M384.101 277.637v6.588a50.1 50.1 0 0 0 22.309 41.685l55.581 37.054a50.1 50.1 0 0 1 22.31 41.686v6.587M384.1 770.288v6.587a50.1 50.1 0 0 1-22.309 41.686l-55.581 37.054A50.099 50.099 0 0 0 283.9 897.3v6.588"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.path
                              ( oneOf
                                  [ D.D !:=
                                      "M384.1 770.288v6.587a50.1 50.1 0 0 1-22.309 41.686l-55.581 37.054A50.099 50.099 0 0 0 283.9 897.3v6.588M484.3 594.937v6.587a50.1 50.1 0 0 1-22.31 41.686l-55.581 37.054A50.1 50.1 0 0 0 384.1 721.95v6.587M484.3 872.575v6.587a50.1 50.1 0 0 1-22.31 41.686l-55.581 37.054a50.098 50.098 0 0 0-22.309 41.686v6.582M584.501 663.824v39.988a50.099 50.099 0 0 1-22.31 41.685l-55.581 37.054a50.102 50.102 0 0 0-22.309 41.686v6.587M283.899 945.637v6.588a50.1 50.1 0 0 1-22.309 41.685l-55.581 37.05a50.12 50.12 0 0 0-22.31 41.69v6.59M384.1 277.637c0 19.946 12.763 37.655 31.686 43.962l137.028 45.676c18.923 6.308 31.686 24.016 31.686 43.962M183.7 463.425v30.69c0 21.564 13.799 40.709 34.257 47.529l134.457 44.819c18.922 6.307 31.686 24.016 31.686 43.962M83.5 102.288c0 19.515 13.554 36.412 32.604 40.645l235.391 52.309c19.05 4.234 32.605 21.13 32.605 40.646M83.5 463.425v-58.45M183.699 542.75V396.625M283.9 1068.8V945.637M83.5 363.225v-141.95M83.5 179.524v-77.237M83.5 60.537V0M384.1 630.425V277.637M484.301 830.824V594.937M584.5 1068.8V663.825M484.301 555.275V452.988M584.5 622.075V452.988M384.1 728.537v-56.362M384.1 1068.8v-20.88M384.1 1006.17V770.287M283.9 903.888V759.85M183.699 1066.71V891.362M83.5 1068.8V716.012M83.5 674.263V505.175"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "83.5"
                                  , D.Cy !:= "384.1"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 83.5 384.1)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "83.5"
                                  , D.Cy !:= "200.399"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 83.5 200.399)"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "83.5"
                                  , D.Cy !:= "81.412"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 83.5 81.412)"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "183.699"
                                  , D.Cy !:= "375.75"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 183.699 375.75)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "183.699"
                                  , D.Cy !:= "563.625"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 183.699 563.625)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "384.1"
                                  , D.Cy !:= "651.3"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 384.1 651.3)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "484.301"
                                  , D.Cy !:= "574.062"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 484.301 574.062)"
                                  , D.Fill !:= "#0EA5E9"
                                  , D.FillOpacity !:= ".42"
                                  , D.Stroke !:= "#0EA5E9"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "384.1"
                                  , D.Cy !:= "749.412"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 384.1 749.412)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "384.1"
                                  , D.Cy !:= "1027.05"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 384.1 1027.05)"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "283.9"
                                  , D.Cy !:= "924.763"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 283.9 924.763)"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "183.699"
                                  , D.Cy !:= "870.487"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 183.699 870.487)"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "283.9"
                                  , D.Cy !:= "738.975"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 283.9 738.975)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "83.5"
                                  , D.Cy !:= "695.138"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 83.5 695.138)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "83.5"
                                  , D.Cy !:= "484.3"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 83.5 484.3)"
                                  , D.Fill !:= "#0EA5E9"
                                  , D.FillOpacity !:= ".42"
                                  , D.Stroke !:= "#0EA5E9"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "484.301"
                                  , D.Cy !:= "432.112"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 484.301 432.112)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "584.5"
                                  , D.Cy !:= "432.112"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 584.5 432.112)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "584.5"
                                  , D.Cy !:= "642.95"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 584.5 642.95)"
                                  , D.Fill !:= "#1E293B"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "484.301"
                                  , D.Cy !:= "851.699"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 484.301 851.699)"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          , D.circle
                              ( oneOf
                                  [ D.Cx !:= "384.1"
                                  , D.Cy !:= "256.763"
                                  , D.R !:= "10.438"
                                  , D.Transform !:=
                                      "rotate(-180 384.1 256.763)"
                                  , D.Stroke !:= "#334155"
                                  ]
                              )
                              []
                          ]
                      ]
                  ]
              , D.div (D.Class !:= "relative")
                  [ D.img
                      ( oneOf
                          [ D.Alt !:= ""
                          , D.Src !:= blurCyanURL
                          , D.Width !:= "530"
                          , D.Height !:= "530"
                          , D.Decoding !:= "async"
                          , pure (xdata "nimg" "1")
                          , D.Class !:= "absolute -top-64 -right-64"
                          , D.Style !:= "color:transparent"
                          ]
                      )
                      []
                  , D.img
                      ( oneOf
                          [ D.Alt !:= ""
                          , D.Src !:= blurIndigoURL
                          , D.Width !:= "567"
                          , D.Height !:= "567"
                          , D.Decoding !:= "async"
                          , pure (xdata "nimg" "1")
                          , D.Class !:= "absolute -bottom-40 -right-44"
                          , D.Style !:= "color:transparent"
                          ]
                      )
                      []
                  , D.div
                      ( D.Class !:=
                          "absolute inset-0 rounded-2xl bg-gradient-to-tr from-sky-300 via-sky-300/70 to-blue-300 opacity-10 blur-lg"
                      )
                      []
                  , D.div
                      ( D.Class !:=
                          "absolute inset-0 rounded-2xl bg-gradient-to-tr from-sky-300 via-sky-300/70 to-blue-300 opacity-10"
                      )
                      []
                  , D.div
                      ( D.Class !:=
                          "relative rounded-2xl bg-[#0A101F]/80 ring-1 ring-white/10 backdrop-blur"
                      )
                      [ D.div
                          ( D.Class !:=
                              "absolute -top-px left-20 right-11 h-px bg-gradient-to-r from-sky-300/0 via-sky-300/70 to-sky-300/0"
                          )
                          []
                      , D.div
                          ( D.Class !:=
                              "absolute -bottom-px left-11 right-20 h-px bg-gradient-to-r from-blue-400/0 via-blue-400 to-blue-400/0"
                          )
                          []
                      , Deku.do
                          setBannerExample /\ bannerExample' <- useState
                            CodeExample
                          bannerExample <- useMemoized
                            ( showBanner $> CodeExample <|> dedup
                                bannerExample'
                            )
                          D.div (D.Class !:= "pl-4 pt-4")
                            [ D.svg
                                ( oneOf
                                    [ D.AriaHidden !:= "true"
                                    , D.ViewBox !:= "0 0 42 10"
                                    , D.Fill !:= "none"
                                    , D.Class !:=
                                        "h-2.5 w-auto stroke-slate-500/30"
                                    ]
                                )
                                [ D.circle
                                    ( oneOf
                                        [ D.Cx !:= "5"
                                        , D.Cy !:= "5"
                                        , D.R !:= "4.5"
                                        ]
                                    )
                                    []
                                , D.circle
                                    ( oneOf
                                        [ D.Cx !:= "21"
                                        , D.Cy !:= "5"
                                        , D.R !:= "4.5"
                                        ]
                                    )
                                    []
                                , D.circle
                                    ( oneOf
                                        [ D.Cx !:= "37"
                                        , D.Cy !:= "5"
                                        , D.R !:= "4.5"
                                        ]
                                    )
                                    []
                                ]
                            , D.div
                                (D.Class !:= "mt-4 flex space-x-2 text-xs")
                                [ D.div
                                    ( klass $ bannerExample <#> case _ of
                                        CodeExample ->
                                          bannerExampleOuterSelected
                                        ButtonExample ->
                                          bannerExampleOuterNotSelected
                                    )
                                    [ D.div
                                        ( oneOf
                                            [ klass $ bannerExample <#>
                                                case _ of
                                                  CodeExample ->
                                                    bannerExampleInnerSelected
                                                  ButtonExample ->
                                                    bannerExampleInnerNotSelected
                                            , click_ do
                                                setBannerExample CodeExample
                                            ]
                                        )
                                        [ text_ "MyButton.purs" ]
                                    ]
                                , D.div
                                    ( klass $ bannerExample <#>
                                        case _ of
                                          ButtonExample ->
                                            bannerExampleOuterSelected
                                          CodeExample ->
                                            bannerExampleOuterNotSelected
                                    )
                                    [ D.div
                                        ( oneOf
                                            [ klass $ bannerExample <#>
                                                case _ of
                                                  ButtonExample ->
                                                    bannerExampleInnerSelected
                                                  CodeExample ->
                                                    bannerExampleInnerNotSelected
                                            , click_
                                                (setBannerExample ButtonExample)
                                            ]
                                        )
                                        [ text_ "Result" ]
                                    ]
                                ]
                            , flip switcher bannerExample case _ of
                                ButtonExample -> D.div
                                  ( D.Class !:=
                                      "mt-6 flex items-start px-1 text-sm"
                                  )
                                  [ D.div
                                      ( oneOf
                                          [ --D.AriaHidden !:= "true",
                                            D.Class !:=
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
                                      ( klass_
                                          "flex flex-row justify-center w-full"
                                      )
                                      [ D.button
                                          ( oneOf
                                              [ D.Class !:=
                                                  "mt-8 rounded-full bg-sky-300 py-2 px-4 text-sm font-semibold text-slate-900 hover:bg-sky-200 focus:outline-none focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-sky-300/50 active:bg-sky-500"
                                              , click_ addConfetti
                                              ]
                                          )
                                          [ text_ "Click me" ]
                                      ]
                                  ]

                                CodeExample -> D.div
                                  ( D.Class !:=
                                      "mt-6 flex items-start px-1 text-sm"
                                  )
                                  [ D.div
                                      ( oneOf
                                          [ --D.AriaHidden !:= "true",
                                            D.Class !:=
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
                                      ( oneOf
                                          [ D.Style !:=
                                              "background:none;padding:0em;margin:0em;"
                                          , D.Class !:=
                                              "prism-code language-purescript flex overflow-x-auto pb-6"
                                          ]
                                      )
                                      [ D.code
                                          ( oneOf
                                              [ D.Class !:= "px-4"
                                              ]
                                          )
                                          [ text_
                                              """myButton :: Nut
myButton =
  D.button
    (buttonStyle <|> confettiClick)
    [text_ "Click me" ]
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