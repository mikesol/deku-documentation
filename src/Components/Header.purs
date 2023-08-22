module Components.Header where

import Prelude

import Assets (dekulogoURL, dekulogodarkURL)
import Components.LeftMatterMobile (leftMatterMobile)
import Components.Link (link')
import Control.Plus (empty)
import DarkModePreference (DarkModePreference(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.DOM.SVG as DS
import Deku.DOM.SVG.Attributes as DSA
import Deku.DOM.Self as Self
import Deku.Do as Deku
import Deku.Hooks (useState)
import Effect (Effect)
import FRP.Dedup (dedup)
import FRP.Poll (Poll)
import Modal (modalClick)
import Navigation (PushState)
import Router.ADT (Route(..))
import Web.DOM as DOM

import Deku.Attribute as Deku.Attribute
import Deku.DOM (Attribute)

clipRule_ :: forall f4 e7. Applicative f4 => String -> f4 (Attribute e7)
clipRule_ v = pure
  ( Deku.Attribute.unsafeAttribute
      { key: "clip-rule"
      , value: Deku.Attribute.prop' v
      }
  )
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
  :: { darkBoolean :: Poll Boolean
     , dark :: Poll DarkModePreference
     , setDark :: DarkModePreference -> Effect Unit
     , setHeaderElement :: DOM.Element -> Effect Unit
     , pushState :: PushState
     , pageIs :: Route -> Poll Unit
     , pageWas :: Route -> Poll Unit
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
      ( [ Self.self_ setHeaderElement
        , DA.klass_
            "sticky top-0 z-50 flex flex-wrap items-center justify-between bg-white px-4 py-5 shadow-md shadow-slate-900/5 transition duration-500 dark:shadow-none sm:px-6 lg:px-8 dark:bg-slate-900/95 dark:backdrop-blur dark:[@supports(backdrop-filter:blur(0))]:bg-slate-900/75"
        ]
      )
      [ D.div [ DA.klass_ "mr-6 flex lg:hidden" ]
          [ D.button
              ( [ DA.xtypeButton
                , DA.klass_ "relative"
                , DL.click_ \_ -> do
                    setNavModalOpen true
                    modalClick (setNavModalOpen false)
                ]
              )
              [ DS.svg
                  ( [ DSA.viewBox_ "0 0 24 24"
                    , DSA.fill_ "none"
                    , DSA.strokeWidth_ "2"
                    , DSA.strokeLinecap_ "round"
                    , DSA.klass_ "h-6 w-6 stroke-slate-500"
                    ]
                  )
                  [ DS.path [ DSA.d_ "M4 7h16M4 12h16M4 17h16" ] [] ]
              ]
          , leftMatterMobile
              { darkBoolean, navModalOpen, pageIs, pageWas, pushState }
          ]
      , D.div [ DA.klass_ "relative flex flex-grow basis-0 items-center" ]
          [ link' pushState GettingStarted empty
              [ D.img
                  ( [ DA.src (darkBoolean <#> \dk ->
                        if dk then dekulogodarkURL else dekulogoURL)
                    , DA.klass_ "w-20 object-contain"
                    ]
                  )
                  []
              ]
          ]
      , D.div
          [ DA.klass_
              "relative flex basis-0 justify-end gap-6 sm:gap-8 md:flex-grow"
          ]
          [ D.div
              ( [ DA.klass_ "relative z-10"
                ]
              )
              [ D.label
                  ( [ DA.klass_ "sr-only"
                    ]
                  )
                  [ text_ "Theme" ]
              , D.button
                  ( [ DA.klass_
                        "flex h-6 w-6 items-center justify-center rounded-lg shadow-md shadow-black/5 ring-1 ring-black/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                    , DA.xtypeButton
                    , DL.runOn DL.click $ darkModeModalOpen <#>
                        if _ then (pure unit)
                        else do
                          setDarkModeModalOpen true
                          modalClick (setDarkModeModalOpen false)
                    ]
                  )
                  [ DS.svg
                      ( [ DSA.viewBox_ "0 0 16 16"
                        , DA.klass $
                            dedup isLightMode <#> keepDarkModeMenuOption
                        ]
                      )
                      [ DS.path
                          ( [ DSA.fillRule_ "evenodd"
                            , clipRule_ "evenodd"
                            , DSA.d_
                                "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                            ]
                          )
                          []
                      ]
                  , DS.svg
                      ( [ DSA.viewBox_ "0 0 16 16"
                        , DA.klass $
                            dedup isDarkMode <#> keepDarkModeMenuOption
                        ]
                      )
                      [ DS.path
                          ( [ DSA.fillRule_ "evenodd"
                            , clipRule_ "evenodd"
                            , DSA.d_
                                "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                            ]
                          )
                          []
                      ]
                  , DS.svg
                      ( [ DSA.viewBox_ "0 0 16 16"
                        , DA.klass $
                            dedup isUsingSystemPreference <#>
                              keepDarkModeMenuOption
                        ]
                      )
                      [ DS.path
                          ( [ DSA.fillRule_ "evenodd"
                            , clipRule_ "evenodd"
                            , DSA.d_
                                "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                            ]
                          )
                          []
                      ]
                  , DS.svg
                      ( [ DSA.viewBox_ "0 0 16 16"
                        , DA.klass_
                            "hidden h-4 w-4 fill-slate-400 [.dark[data-theme=system]_&]:block"
                        ]
                      )
                      [ DS.path
                          ( [ DSA.fillRule_ "evenodd"
                            , clipRule_ "evenodd"
                            , DSA.d_
                                "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                            ]
                          )
                          []
                      ]
                  ]
              , D.ul
                  ( [ DA.klass $ darkModeModalOpen <#>
                        (if _ then "" else "hidden ") >>>
                          ( _ <>
                              "absolute top-full left-1/2 mt-3 w-36 -translate-x-1/2 space-y-1 rounded-xl bg-white p-3 text-sm font-medium shadow-md shadow-black/5 ring-1 ring-black/5 dark:bg-slate-800 dark:ring-white/5"
                          )
                    , DA.role_ "listbox"
                    ]
                  )
                  [ D.li
                      ( [ DA.klass $ isLightMode <#> changeClassSelection
                        , DL.click_ \_ -> (setDark LightMode)
                        , DA.role_ "option"
                        ]
                      )
                      [ D.div
                          [ DA.klass_
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          ]
                          [ DS.svg
                              ( [ DSA.viewBox_ "0 0 16 16"
                                , DA.klass $ isLightMode <#>
                                    changeSVGClassSelection
                                ]
                              )
                              [ DS.path
                                  ( [ DSA.fillRule_ "evenodd"
                                    , clipRule_ "evenodd"
                                    , DSA.d_
                                        "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                                    ]
                                  )
                                  []
                              ]
                          ]
                      , D.div [ DA.klass_ "ml-3" ] [ text_ "Light" ]
                      ]
                  , D.li
                      ( [ DA.klass $ isDarkMode <#> changeClassSelection
                        , DA.role_ "option"
                        , DL.click_ \_ -> (setDark DarkMode)
                        ]
                      )
                      [ D.div
                          [ DA.klass_
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          ]
                          [ DS.svg
                              ( [ DSA.viewBox_ "0 0 16 16"
                                , DA.klass $ isDarkMode <#>
                                    changeSVGClassSelection
                                ]
                              )
                              [ DS.path
                                  ( [ DSA.fillRule_ "evenodd"
                                    , clipRule_ "evenodd"
                                    , DSA.d_
                                        "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                                    ]
                                  )
                                  []
                              ]
                          ]
                      , D.div [ DA.klass_ "ml-3" ] [ text_ "Dark" ]
                      ]
                  , D.li
                      ( [ DA.klass $ isUsingSystemPreference <#>
                            changeClassSelection
                        , DA.role_ "option"
                        , DL.click_ \_ -> (setDark SystemDarkModePreference)
                        ]
                      )
                      [ D.div
                          [ DA.klass_
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          ]
                          [ DS.svg
                              ( [ DSA.viewBox_ "0 0 16 16"
                                , DA.klass $ isUsingSystemPreference <#>
                                    changeSVGClassSelection
                                ]
                              )
                              [ DS.path
                                  ( [ DSA.fillRule_ "evenodd"
                                    , clipRule_ "evenodd"
                                    , DSA.d_
                                        "M1 4a3 3 0 0 1 3-3h8a3 3 0 0 1 3 3v4a3 3 0 0 1-3 3h-1.5l.31 1.242c.084.333.36.573.63.808.091.08.182.158.264.24A1 1 0 0 1 11 15H5a1 1 0 0 1-.704-1.71c.082-.082.173-.16.264-.24.27-.235.546-.475.63-.808L5.5 11H4a3 3 0 0 1-3-3V4Zm3-1a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H4Z"
                                    ]
                                  )
                                  []
                              ]
                          ]
                      , D.div [ DA.klass_ "ml-3" ] [ text_ "System" ]
                      ]
                  ]
              ]
          , D.a
              ( [ DA.klass_ "group"
                , DA.href_ "https://github.com/mikesol/purescript-deku"
                ]
              )
              [ DS.svg
                  ( [ DSA.viewBox_ "0 0 16 16"
                    , DA.klass_
                        "h-6 w-6 fill-slate-400 group-hover:fill-slate-500 dark:group-hover:fill-slate-300"
                    ]
                  )
                  [ DS.path
                      [ DSA.d_
                          "M8 0C3.58 0 0 3.58 0 8C0 11.54 2.29 14.53 5.47 15.59C5.87 15.66 6.02 15.42 6.02 15.21C6.02 15.02 6.01 14.39 6.01 13.72C4 14.09 3.48 13.23 3.32 12.78C3.23 12.55 2.84 11.84 2.5 11.65C2.22 11.5 1.82 11.13 2.49 11.12C3.12 11.11 3.57 11.7 3.72 11.94C4.44 13.15 5.59 12.81 6.05 12.6C6.12 12.08 6.33 11.73 6.56 11.53C4.78 11.33 2.92 10.64 2.92 7.58C2.92 6.71 3.23 5.99 3.74 5.43C3.66 5.23 3.38 4.41 3.82 3.31C3.82 3.31 4.49 3.1 6.02 4.13C6.66 3.95 7.34 3.86 8.02 3.86C8.7 3.86 9.38 3.95 10.02 4.13C11.55 3.09 12.22 3.31 12.22 3.31C12.66 4.41 12.38 5.23 12.3 5.43C12.81 5.99 13.12 6.7 13.12 7.58C13.12 10.65 11.25 11.33 9.47 11.53C9.76 11.78 10.01 12.26 10.01 13.01C10.01 14.08 10 14.94 10 15.21C10 15.42 10.15 15.67 10.55 15.59C13.71 14.53 16 11.53 16 8C16 3.58 12.42 0 8 0Z"
                      ]
                      []
                  ]
              ]
          ]
      ]
