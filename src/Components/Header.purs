module Components.Header where

import Prelude

import Assets (dekulogoURL, dekulogodarkURL)
import Components.LeftMatterMobile (leftMatterMobile)
import Components.Link (link')
import Control.Plus (empty)
import DarkModePreference (DarkModePreference(..))
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (:=))
import Deku.Attributes (klass, klass_)
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Hooks (useState)
import Deku.Do as Deku
import Deku.Listeners (click, click_)
import Effect (Effect)
import FRP.Dedup (dedup)
import FRP.Event (Event)
import Modal (modalClick)
import Navigation (PushState)
import Router.ADT (Route(..))
import Web.DOM as DOM

classBrightnessModeSelected :: String
classBrightnessModeSelected =
  "flex cursor-pointer select-none items-center rounded-[0.625rem] p-1 text-sky-500"

classBrightnessModeNotSelected :: String
classBrightnessModeNotSelected =
  "flex cursor-pointer select-none items-center rounded-[0.625rem] p-1 text-slate-700 dark:text-slate-400"

changeClassSelection :: Boolean -> String
changeClassSelection =
  if _ then classBrightnessModeSelected else classBrightnessModeNotSelected

classSVGBrightnessModeSelected :: String
classSVGBrightnessModeSelected = "h-4 w-4 fill-sky-400 dark:fill-sky-400"

classSVGBrightnessModeNotSelected :: String
classSVGBrightnessModeNotSelected = "h-4 w-4 fill-slate-400"

changeSVGClassSelection :: Boolean -> String
changeSVGClassSelection =
  if _ then classSVGBrightnessModeSelected
  else classSVGBrightnessModeNotSelected

header
  :: { darkBoolean :: Event Boolean
     , dark :: Event DarkModePreference
     , setDark :: DarkModePreference -> Effect Unit
     , setHeaderElement :: DOM.Element -> Effect Unit
     , pushState :: PushState
     , pageIs :: Route -> Event Unit
     , pageWas :: Route -> Event Unit
     }
  -> Nut
header
  { setHeaderElement, darkBoolean, dark, setDark, pageIs, pageWas, pushState } =
  Deku.do
    setDarkModeModalOpen /\ darkModeModalOpen <- useState false
    setNavModalOpen /\ navModalOpen <- useState false
    let
      keepDarkModeMenuOption = (if _ then "" else "hidden ") >>>
        ( _ <>
            "h-4 w-4 fill-sky-400 [[data-theme=light]_&]:block"
        )
      isLightMode = dark <#> case _ of
        LightMode -> true
        _ -> false
      isDarkMode = dark <#> case _ of
        DarkMode -> true
        _ -> false
      isUsingSystemPreference = dark <#> case _ of
        SystemDarkModePreference -> true
        _ -> false
    D.header
      ( [ D.Self !:= setHeaderElement
        , D.Class !:=
            "sticky top-0 z-50 flex flex-wrap items-center justify-between bg-white px-4 py-5 shadow-md shadow-slate-900/5 transition duration-500 dark:shadow-none sm:px-6 lg:px-8 dark:bg-slate-900/95 dark:backdrop-blur dark:[@supports(backdrop-filter:blur(0))]:bg-slate-900/75"
        ]
      )
      [ D.div [ D.Class !:= "mr-6 flex lg:hidden" ]
          [ D.button
              ( [ D.Xtype !:= "button"
                , D.Class !:= "relative"
                , click_ do
                    setNavModalOpen true
                    modalClick (setNavModalOpen false)
                ]
              )
              [ D.svg
                  ( [ D.AriaHidden !:= "true"
                    , D.ViewBox !:= "0 0 24 24"
                    , D.Fill !:= "none"
                    , D.StrokeWidth !:= "2"
                    , D.StrokeLinecap !:= "round"
                    , D.Class !:= "h-6 w-6 stroke-slate-500"
                    ]
                  )
                  [ D.path [ D.D !:= "M4 7h16M4 12h16M4 17h16" ] [] ]
              ]
          , leftMatterMobile
              { darkBoolean, navModalOpen, pageIs, pageWas, pushState }
          ]
      , D.div [ D.Class !:= "relative flex flex-grow basis-0 items-center" ]
          [ link' pushState GettingStarted empty
              [ D.img
                  ( [ darkBoolean <#> \dk -> D.Src :=
                        if dk then dekulogodarkURL else dekulogoURL
                    , klass_ "w-20 object-contain"
                    ]
                  )
                  []
              ]
          ]
      -- , D.div (D.Class !:= "-my-5 mr-6 sm:mr-8 md:mr-0")
      --     [ D.button
      --         ( oneOf
      --             [ D.Xtype !:= "button"
      --             , D.Class !:=
      --                 "group flex h-6 w-6 items-center justify-center sm:justify-start md:h-auto md:w-80 md:flex-none md:rounded-lg md:py-2.5 md:pl-4 md:pr-3.5 md:text-sm md:ring-1 md:ring-slate-200 md:hover:ring-slate-300 dark:md:bg-slate-800/75 dark:md:ring-inset dark:md:ring-white/5 dark:md:hover:bg-slate-700/40 dark:md:hover:ring-slate-500 lg:w-96"
      --             ]
      --         )
      --         [ D.svg
      --             ( oneOf
      --                 [ D.AriaHidden !:= "true"
      --                 , D.ViewBox !:= "0 0 20 20"
      --                 , D.Class !:=
      --                     "h-5 w-5 flex-none fill-slate-400 group-hover:fill-slate-500 dark:fill-slate-500 md:group-hover:fill-slate-400"
      --                 ]
      --             )
      --             [ D.path
      --                 ( D.D !:=
      --                     "M16.293 17.707a1 1 0 0 0 1.414-1.414l-1.414 1.414ZM9 14a5 5 0 0 1-5-5H2a7 7 0 0 0 7 7v-2ZM4 9a5 5 0 0 1 5-5V2a7 7 0 0 0-7 7h2Zm5-5a5 5 0 0 1 5 5h2a7 7 0 0 0-7-7v2Zm8.707 12.293-3.757-3.757-1.414 1.414 3.757 3.757 1.414-1.414ZM14 9a4.98 4.98 0 0 1-1.464 3.536l1.414 1.414A6.98 6.98 0 0 0 16 9h-2Zm-1.464 3.536A4.98 4.98 0 0 1 9 14v2a6.98 6.98 0 0 0 4.95-2.05l-1.414-1.414Z"
      --                 )
      --                 []
      --             ]
      --         , D.span
      --             ( D.Class !:=
      --                 "sr-only md:not-sr-only md:ml-2 md:text-slate-500 md:dark:text-slate-400"
      --             )
      --             [ text_ "Search docs" ]
      --         , D.kbd
      --             ( D.Class !:=
      --                 "ml-auto hidden font-medium text-slate-400 dark:text-slate-500 md:block"
      --             )
      --             [ D.kbd (D.Class !:= "font-sans") [ text_ "⌘" ]
      --             , D.kbd (D.Class !:= "font-sans") [ text_ "K" ]
      --             ]
      --         ]
      --     ]
      , D.div
          [ D.Class !:=
              "relative flex basis-0 justify-end gap-6 sm:gap-8 md:flex-grow"
          ]
          [ D.div
              ( [ D.Class !:= "relative z-10"
                ]
              )
              [ D.label
                  ( [ D.Class !:= "sr-only"
                    ]
                  )
                  [ text_ "Theme" ]
              , D.button
                  ( [ D.Class !:=
                        "flex h-6 w-6 items-center justify-center rounded-lg shadow-md shadow-black/5 ring-1 ring-black/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                    , D.Xtype !:= "button"
                    , click $ darkModeModalOpen <#>
                        if _ then (pure unit)
                        else do
                          setDarkModeModalOpen true
                          modalClick (setDarkModeModalOpen false)
                    ]
                  )
                  [ D.svg
                      ( [ D.AriaHidden !:= "true"
                        , D.ViewBox !:= "0 0 16 16"
                        , klass $
                            dedup isLightMode <#> keepDarkModeMenuOption
                        ]
                      )
                      [ D.path
                          ( [ D.FillRule !:= "evenodd"
                            , D.ClipRule !:= "evenodd"
                            , D.D !:=
                                "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                            ]
                          )
                          []
                      ]
                  , D.svg
                      ( [ D.AriaHidden !:= "true"
                        , D.ViewBox !:= "0 0 16 16"
                        , klass $
                            dedup isDarkMode <#> keepDarkModeMenuOption
                        ]
                      )
                      [ D.path
                          ( [ D.FillRule !:= "evenodd"
                            , D.ClipRule !:= "evenodd"
                            , D.D !:=
                                "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                            ]
                          )
                          []
                      ]
                  , D.svg
                      ( [ D.AriaHidden !:= "true"
                        , D.ViewBox !:= "0 0 16 16"
                        , klass $
                            dedup isUsingSystemPreference <#>
                              keepDarkModeMenuOption
                        ]
                      )
                      [ D.path
                          ( [ D.FillRule !:= "evenodd"
                            , D.ClipRule !:= "evenodd"
                            , D.D !:=
                                "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                            ]
                          )
                          []
                      ]
                  , D.svg
                      ( [ D.AriaHidden !:= "true"
                        , D.ViewBox !:= "0 0 16 16"
                        , D.Class !:=
                            "hidden h-4 w-4 fill-slate-400 [.dark[data-theme=system]_&]:block"
                        ]
                      )
                      [ D.path
                          ( [ D.FillRule !:= "evenodd"
                            , D.ClipRule !:= "evenodd"
                            , D.D !:=
                                "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                            ]
                          )
                          []
                      ]
                  ]
              , D.ul
                  ( [ klass $ darkModeModalOpen <#>
                        (if _ then "" else "hidden ") >>>
                          ( _ <>
                              "absolute top-full left-1/2 mt-3 w-36 -translate-x-1/2 space-y-1 rounded-xl bg-white p-3 text-sm font-medium shadow-md shadow-black/5 ring-1 ring-black/5 dark:bg-slate-800 dark:ring-white/5"
                          )
                    , D.Role !:= "listbox"
                    ]
                  )
                  [ D.li
                      ( [ klass $ isLightMode <#> changeClassSelection
                        , click_ (setDark LightMode)
                        , D.Role !:= "option"
                        ]
                      )
                      [ D.div
                          [ D.Class !:=
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          ]
                          [ D.svg
                              ( [ D.AriaHidden !:= "true"
                                , D.ViewBox !:= "0 0 16 16"
                                , klass $ isLightMode <#>
                                    changeSVGClassSelection
                                ]
                              )
                              [ D.path
                                  ( [ D.FillRule !:= "evenodd"
                                    , D.ClipRule !:= "evenodd"
                                    , D.D !:=
                                        "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                                    ]
                                  )
                                  []
                              ]
                          ]
                      , D.div [ D.Class !:= "ml-3" ] [ text_ "Light" ]
                      ]
                  , D.li
                      ( [ klass $ isDarkMode <#> changeClassSelection
                        , D.Role !:= "option"
                        , click_ (setDark DarkMode)
                        ]
                      )
                      [ D.div
                          [ D.Class !:=
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          ]
                          [ D.svg
                              ( [ D.AriaHidden !:= "true"
                                , D.ViewBox !:= "0 0 16 16"
                                , klass $ isDarkMode <#>
                                    changeSVGClassSelection
                                ]
                              )
                              [ D.path
                                  ( [ D.FillRule !:= "evenodd"
                                    , D.ClipRule !:= "evenodd"
                                    , D.D !:=
                                        "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                                    ]
                                  )
                                  []
                              ]
                          ]
                      , D.div [ D.Class !:= "ml-3" ] [ text_ "Dark" ]
                      ]
                  , D.li
                      ( [ klass $ isUsingSystemPreference <#>
                            changeClassSelection
                        , D.Role !:= "option"
                        , click_ (setDark SystemDarkModePreference)
                        ]
                      )
                      [ D.div
                          [ D.Class !:=
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          ]
                          [ D.svg
                              ( [ D.AriaHidden !:= "true"
                                , D.ViewBox !:= "0 0 16 16"
                                , klass $ isUsingSystemPreference <#>
                                    changeSVGClassSelection
                                ]
                              )
                              [ D.path
                                  ( [ D.FillRule !:= "evenodd"
                                    , D.ClipRule !:= "evenodd"
                                    , D.D !:=
                                        "M1 4a3 3 0 0 1 3-3h8a3 3 0 0 1 3 3v4a3 3 0 0 1-3 3h-1.5l.31 1.242c.084.333.36.573.63.808.091.08.182.158.264.24A1 1 0 0 1 11 15H5a1 1 0 0 1-.704-1.71c.082-.082.173-.16.264-.24.27-.235.546-.475.63-.808L5.5 11H4a3 3 0 0 1-3-3V4Zm3-1a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H4Z"
                                    ]
                                  )
                                  []
                              ]
                          ]
                      , D.div [ D.Class !:= "ml-3" ] [ text_ "System" ]
                      ]
                  ]
              ]
          , D.a
              ( [ D.Class !:= "group"
                , D.Href !:= "https://github.com/mikesol/purescript-deku"
                ]
              )
              [ D.svg
                  ( [ D.AriaHidden !:= "true"
                    , D.ViewBox !:= "0 0 16 16"
                    , D.Class !:=
                        "h-6 w-6 fill-slate-400 group-hover:fill-slate-500 dark:group-hover:fill-slate-300"
                    ]
                  )
                  [ D.path
                      [ D.D !:=
                          "M8 0C3.58 0 0 3.58 0 8C0 11.54 2.29 14.53 5.47 15.59C5.87 15.66 6.02 15.42 6.02 15.21C6.02 15.02 6.01 14.39 6.01 13.72C4 14.09 3.48 13.23 3.32 12.78C3.23 12.55 2.84 11.84 2.5 11.65C2.22 11.5 1.82 11.13 2.49 11.12C3.12 11.11 3.57 11.7 3.72 11.94C4.44 13.15 5.59 12.81 6.05 12.6C6.12 12.08 6.33 11.73 6.56 11.53C4.78 11.33 2.92 10.64 2.92 7.58C2.92 6.71 3.23 5.99 3.74 5.43C3.66 5.23 3.38 4.41 3.82 3.31C3.82 3.31 4.49 3.1 6.02 4.13C6.66 3.95 7.34 3.86 8.02 3.86C8.7 3.86 9.38 3.95 10.02 4.13C11.55 3.09 12.22 3.31 12.22 3.31C12.66 4.41 12.38 5.23 12.3 5.43C12.81 5.99 13.12 6.7 13.12 7.58C13.12 10.65 11.25 11.33 9.47 11.53C9.76 11.78 10.01 12.26 10.01 13.01C10.01 14.08 10 14.94 10 15.21C10 15.42 10.15 15.67 10.55 15.59C13.71 14.53 16 11.53 16 8C16 3.58 12.42 0 8 0Z"
                      ]
                      []
                  ]
              ]
          ]
      ]