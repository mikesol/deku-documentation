module Components.FrontPage where

import Prelude

import Assets (blurCyanURL, blurIndigoURL)
import Components.BottomNav (bottomNav)
import Components.Disclaimer (disclaimer)
import Components.ProTip (proTip)
import Data.Foldable (oneOf)
import Deku.Attribute (xdata, (!:=))
import Deku.Control (text_)
import Deku.Core (Nut, fixed)
import Deku.DOM as D

everything :: Nut
everything = fixed
  [ D.header
      ( D.Class !:=
          "sticky top-0 z-50 flex flex-wrap items-center justify-between bg-white px-4 py-5 shadow-md shadow-slate-900/5 transition duration-500 dark:shadow-none sm:px-6 lg:px-8 dark:bg-transparent"
      )
      [ D.div (D.Class !:= "mr-6 flex lg:hidden")
          [ D.button
              ( oneOf
                  [ D.Xtype !:= "button"
                  , D.Class !:= "relative"
                  -- , D.AriaLabel !:= "Open navigation"
                  ]
              )
              [ D.svg
                  ( oneOf
                      [ D.AriaHidden !:= "true"
                      , D.ViewBox !:= "0 0 24 24"
                      , D.Fill !:= "none"
                      , D.StrokeWidth !:= "2"
                      , D.StrokeLinecap !:= "round"
                      , D.Class !:= "h-6 w-6 stroke-slate-500"
                      ]
                  )
                  [ D.path (D.D !:= "M4 7h16M4 12h16M4 17h16") [] ]
              ]
          , D.div
              ( D.Style !:=
                  "position:fixed;top:1px;left:1px;width:1px;height:0;padding:0;margin:-1px;overflow:hidden;clip:rect(0, 0, 0, 0);white-space:nowrap;border-width:0;display:none"
              )
              []
          ]
      , D.div (D.Class !:= "relative flex flex-grow basis-0 items-center")
          [ D.a
              ( oneOf
                  [
                    -- D.AriaLabel !:= "Home page",
                    D.Href !:= "/"
                  ]
              )
              [ D.svg
                  ( oneOf
                      [ D.AriaHidden !:= "true"
                      , D.ViewBox !:= "0 0 36 36"
                      , D.Fill !:= "none"
                      , D.Class !:= "h-9 w-9 lg:hidden"
                      ]
                  )
                  [ D.g
                      ( oneOf
                          [ D.Fill !:= "none"
                          , D.Stroke !:= "#38BDF8"
                          , D.StrokeLinejoin !:= "round"
                          , D.StrokeWidth !:= "3"
                          ]
                      )
                      [ D.path
                          ( D.D !:=
                              "M10.308 5L18 17.5 10.308 30 2.615 17.5 10.308 5z"
                          )
                          []
                      , D.path
                          ( D.D !:=
                              "M18 17.5L10.308 5h15.144l7.933 12.5M18 17.5h15.385L25.452 30H10.308L18 17.5z"
                          )
                          []
                      ]
                  ]
              , D.svg
                  ( oneOf
                      [ D.AriaHidden !:= "true"
                      , D.ViewBox !:= "0 0 227 36"
                      , D.Fill !:= "none"
                      , D.Class !:=
                          "hidden h-9 w-auto fill-slate-700 dark:fill-sky-100 lg:block"
                      ]
                  )
                  [ D.g
                      ( oneOf
                          [ D.Fill !:= "none"
                          , D.Stroke !:= "#38BDF8"
                          , D.StrokeLinejoin !:= "round"
                          , D.StrokeWidth !:= "3"
                          ]
                      )
                      [ D.path
                          ( D.D !:=
                              "M10.308 5L18 17.5 10.308 30 2.615 17.5 10.308 5z"
                          )
                          []
                      , D.path
                          ( D.D !:=
                              "M18 17.5L10.308 5h15.144l7.933 12.5M18 17.5h15.385L25.452 30H10.308L18 17.5z"
                          )
                          []
                      ]
                  , D.path
                      ( D.D !:=
                          "M55.96 26.2c-1.027 0-1.973-.173-2.84-.52a6.96 6.96 0 01-2.24-1.5 6.979 6.979 0 01-1.46-2.3c-.347-.893-.52-1.867-.52-2.92 0-1.027.18-1.973.54-2.84a6.71 6.71 0 011.52-2.28 6.922 6.922 0 012.3-1.52 7.48 7.48 0 012.86-.54c.667 0 1.32.093 1.96.28a6.12 6.12 0 011.78.78 5.7 5.7 0 011.4 1.24l-1.88 2.08a6.272 6.272 0 00-1-.82 3.728 3.728 0 00-1.08-.54 3.542 3.542 0 00-1.2-.2 4.14 4.14 0 00-1.62.32 3.991 3.991 0 00-1.3.9 4.197 4.197 0 00-.9 1.38 4.755 4.755 0 00-.32 1.78c0 .667.107 1.273.32 1.82.213.533.513.993.9 1.38.387.373.847.667 1.38.88.547.2 1.147.3 1.8.3a4.345 4.345 0 002.34-.68c.347-.213.653-.46.92-.74l1.46 2.34c-.32.36-.753.687-1.3.98a7.784 7.784 0 01-1.8.7c-.667.16-1.34.24-2.02.24zm6.99-.2l5.48-14h2.68l5.46 14h-3.08l-2.82-7.54c-.08-.213-.18-.487-.3-.82a922.595 922.595 0 00-.68-2.12 13.694 13.694 0 01-.24-.86l.54-.02c-.08.307-.174.627-.28.96-.094.32-.194.653-.3 1-.108.333-.22.66-.34.98-.12.32-.234.633-.34.94L65.91 26h-2.96zm2.54-2.94l.98-2.42h6.42l1 2.42h-8.4zm19.794 3.14c-1.026 0-1.973-.173-2.84-.52a6.96 6.96 0 01-2.24-1.5 6.98 6.98 0 01-1.46-2.3c-.346-.893-.52-1.867-.52-2.92 0-1.027.18-1.973.54-2.84a6.71 6.71 0 011.52-2.28 6.923 6.923 0 012.3-1.52 7.48 7.48 0 012.86-.54c.667 0 1.32.093 1.96.28a6.118 6.118 0 011.78.78c.547.347 1.014.76 1.4 1.24l-1.88 2.08a6.272 6.272 0 00-1-.82 3.728 3.728 0 00-1.08-.54 3.542 3.542 0 00-1.2-.2 4.14 4.14 0 00-1.62.32 3.992 3.992 0 00-1.3.9 4.197 4.197 0 00-.9 1.38 4.755 4.755 0 00-.32 1.78c0 .667.107 1.273.32 1.82.214.533.514.993.9 1.38.387.373.847.667 1.38.88.547.2 1.147.3 1.8.3a4.345 4.345 0 002.34-.68 4.53 4.53 0 00.92-.74l1.46 2.34c-.32.36-.753.687-1.3.98a7.784 7.784 0 01-1.8.7c-.666.16-1.34.24-2.02.24zm17.469-.2V12h3v14h-3zm-8.82 0V12h3v14h-3zm1.2-5.62l.02-2.72h9.14v2.72h-9.16zM110.402 26V12h9.46v2.64h-6.54v8.72h6.68V26h-9.6zm1.4-5.86v-2.56h7.1v2.56h-7.1zM122.437 26l5.48-14h2.68l5.46 14h-3.08l-2.82-7.54c-.08-.213-.18-.487-.3-.82l-.34-1.06-.34-1.06a14.73 14.73 0 01-.24-.86l.54-.02c-.08.307-.173.627-.28.96a63.3 63.3 0 01-.3 1c-.106.333-.22.66-.34.98-.12.32-.233.633-.34.94l-2.82 7.48h-2.96zm2.54-2.94l.98-2.42h6.42l1 2.42h-8.4zM139.023 26V12h5.74c1.027 0 1.953.173 2.78.52.84.333 1.56.813 2.16 1.44a6.097 6.097 0 011.4 2.2c.32.853.48 1.8.48 2.84 0 1.027-.16 1.973-.48 2.84a6.438 6.438 0 01-1.38 2.22 6.394 6.394 0 01-2.16 1.44c-.84.333-1.773.5-2.8.5h-5.74zm3-2.18l-.32-.52h2.96c.6 0 1.14-.1 1.62-.3.48-.213.887-.5 1.22-.86.347-.373.607-.827.78-1.36.173-.533.26-1.127.26-1.78a5.56 5.56 0 00-.26-1.76 3.595 3.595 0 00-.78-1.36 3.323 3.323 0 00-1.22-.86 3.948 3.948 0 00-1.62-.32h-3.02l.38-.48v9.6zM158.671 26l-5.58-14h3.18l2.92 7.58c.16.413.293.78.4 1.1.12.307.22.6.3.88.093.267.18.533.26.8.08.253.16.533.24.84l-.58.02c.107-.413.213-.793.32-1.14.107-.36.227-.733.36-1.12.133-.387.3-.847.5-1.38l2.76-7.58h3.16l-5.62 14h-2.62zm8.114 0l5.48-14h2.68l5.46 14h-3.08l-2.82-7.54c-.08-.213-.18-.487-.3-.82l-.34-1.06-.34-1.06a13.293 13.293 0 01-.24-.86l.54-.02c-.08.307-.173.627-.28.96a63.3 63.3 0 01-.3 1c-.107.333-.22.66-.34.98-.12.32-.233.633-.34.94l-2.82 7.48h-2.96zm2.54-2.94l.98-2.42h6.42l1 2.42h-8.4zM183.371 26V12h2.68l7.74 10.46h-.56c-.054-.413-.1-.813-.14-1.2l-.12-1.2c-.027-.413-.054-.833-.08-1.26-.014-.44-.027-.9-.04-1.38a56.825 56.825 0 01-.02-1.6V12h2.94v14h-2.72l-7.9-10.56.76.02c.066.693.12 1.287.16 1.78a36.623 36.623 0 01.18 2.2c.026.267.04.52.04.76.013.24.02.493.02.76V26h-2.94zm23.175.2c-1.027 0-1.973-.173-2.84-.52-.853-.36-1.6-.86-2.24-1.5a6.979 6.979 0 01-1.46-2.3c-.347-.893-.52-1.867-.52-2.92 0-1.027.18-1.973.54-2.84a6.71 6.71 0 011.52-2.28 6.919 6.919 0 012.3-1.52 7.48 7.48 0 012.86-.54c.667 0 1.32.093 1.96.28a6.12 6.12 0 011.78.78 5.7 5.7 0 011.4 1.24l-1.88 2.08a6.259 6.259 0 00-1-.82 3.721 3.721 0 00-1.08-.54 3.54 3.54 0 00-1.2-.2 4.14 4.14 0 00-1.62.32 3.991 3.991 0 00-1.3.9 4.206 4.206 0 00-.9 1.38 4.76 4.76 0 00-.32 1.78c0 .667.107 1.273.32 1.82.213.533.513.993.9 1.38.387.373.847.667 1.38.88.547.2 1.147.3 1.8.3a4.35 4.35 0 002.34-.68c.347-.213.653-.46.92-.74l1.46 2.34c-.32.36-.753.687-1.3.98a7.773 7.773 0 01-1.8.7c-.667.16-1.34.24-2.02.24zm8.649-.2V12h9.46v2.64h-6.54v8.72h6.68V26h-9.6zm1.4-5.86v-2.56h7.1v2.56h-7.1z"
                      )
                      []
                  ]
              ]
          ]
      , D.div (D.Class !:= "-my-5 mr-6 sm:mr-8 md:mr-0")
          [ D.button
              ( oneOf
                  [ D.Xtype !:= "button"
                  , D.Class !:=
                      "group flex h-6 w-6 items-center justify-center sm:justify-start md:h-auto md:w-80 md:flex-none md:rounded-lg md:py-2.5 md:pl-4 md:pr-3.5 md:text-sm md:ring-1 md:ring-slate-200 md:hover:ring-slate-300 dark:md:bg-slate-800/75 dark:md:ring-inset dark:md:ring-white/5 dark:md:hover:bg-slate-700/40 dark:md:hover:ring-slate-500 lg:w-96"
                  ]
              )
              [ D.svg
                  ( oneOf
                      [ D.AriaHidden !:= "true"
                      , D.ViewBox !:= "0 0 20 20"
                      , D.Class !:=
                          "h-5 w-5 flex-none fill-slate-400 group-hover:fill-slate-500 dark:fill-slate-500 md:group-hover:fill-slate-400"
                      ]
                  )
                  [ D.path
                      ( D.D !:=
                          "M16.293 17.707a1 1 0 0 0 1.414-1.414l-1.414 1.414ZM9 14a5 5 0 0 1-5-5H2a7 7 0 0 0 7 7v-2ZM4 9a5 5 0 0 1 5-5V2a7 7 0 0 0-7 7h2Zm5-5a5 5 0 0 1 5 5h2a7 7 0 0 0-7-7v2Zm8.707 12.293-3.757-3.757-1.414 1.414 3.757 3.757 1.414-1.414ZM14 9a4.98 4.98 0 0 1-1.464 3.536l1.414 1.414A6.98 6.98 0 0 0 16 9h-2Zm-1.464 3.536A4.98 4.98 0 0 1 9 14v2a6.98 6.98 0 0 0 4.95-2.05l-1.414-1.414Z"
                      )
                      []
                  ]
              , D.span
                  ( D.Class !:=
                      "sr-only md:not-sr-only md:ml-2 md:text-slate-500 md:dark:text-slate-400"
                  )
                  [ text_ "Search docs" ]
              , D.kbd
                  ( D.Class !:=
                      "ml-auto hidden font-medium text-slate-400 dark:text-slate-500 md:block"
                  )
                  [ D.kbd (D.Class !:= "font-sans") [ text_ "⌘" ]
                  , D.kbd (D.Class !:= "font-sans") [ text_ "K" ]
                  ]
              ]
          ]
      , D.div
          ( D.Class !:=
              "relative flex basis-0 justify-end gap-6 sm:gap-8 md:flex-grow"
          )
          [ D.div
              ( oneOf
                  [ D.Class !:= "relative z-10"
                  , pure (xdata "headlessui-state" "")
                  ]
              )
              [ D.label
                  ( oneOf
                      [ D.Class !:= "sr-only"
                      , D.Id !:= "headlessui-listbox-label-:R6ccm:"
                      , pure (xdata "headlessui-state" "")
                      ]
                  )
                  [ text_ "Theme" ]
              , D.button
                  ( oneOf
                      [ D.Class !:=
                          "flex h-6 w-6 items-center justify-center rounded-lg shadow-md shadow-black/5 ring-1 ring-black/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                      , D.Id !:= "headlessui-listbox-button-:Raccm:"
                      , D.Xtype !:= "button"
                      -- , D.AriaHaspopup !:= "true"
                      -- , D.AriaExpanded !:= "false"
                      , pure (xdata "headlessui-state" "")
                      -- , D.AriaLabelledby !:=
                      --    "headlessui-listbox-label-:R6ccm: headlessui-listbox-button-:Raccm:"
                      -- , D.AriaLabel !:= "System"
                      ]
                  )
                  [ D.svg
                      ( oneOf
                          [ D.AriaHidden !:= "true"
                          , D.ViewBox !:= "0 0 16 16"
                          , D.Class !:=
                              "h-4 w-4 fill-sky-400 [[data-theme=light]_&]:block"
                          ]
                      )
                      [ D.path
                          ( oneOf
                              [ D.FillRule !:= "evenodd"
                              , D.ClipRule !:= "evenodd"
                              , D.D !:=
                                  "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                              ]
                          )
                          []
                      ]
                  , D.svg
                      ( oneOf
                          [ D.AriaHidden !:= "true"
                          , D.ViewBox !:= "0 0 16 16"
                          , D.Class !:=
                              "hidden h-4 w-4 fill-sky-400 [[data-theme=dark]_&]:block"
                          ]
                      )
                      [ D.path
                          ( oneOf
                              [ D.FillRule !:= "evenodd"
                              , D.ClipRule !:= "evenodd"
                              , D.D !:=
                                  "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                              ]
                          )
                          []
                      ]
                  , D.svg
                      ( oneOf
                          [ D.AriaHidden !:= "true"
                          , D.ViewBox !:= "0 0 16 16"
                          , D.Class !:=
                              "hidden h-4 w-4 fill-slate-400 [:not(.dark)[data-theme=system]_&]:block"
                          ]
                      )
                      [ D.path
                          ( oneOf
                              [ D.FillRule !:= "evenodd"
                              , D.ClipRule !:= "evenodd"
                              , D.D !:=
                                  "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                              ]
                          )
                          []
                      ]
                  , D.svg
                      ( oneOf
                          [ D.AriaHidden !:= "true"
                          , D.ViewBox !:= "0 0 16 16"
                          , D.Class !:=
                              "hidden h-4 w-4 fill-slate-400 [.dark[data-theme=system]_&]:block"
                          ]
                      )
                      [ D.path
                          ( oneOf
                              [ D.FillRule !:= "evenodd"
                              , D.ClipRule !:= "evenodd"
                              , D.D !:=
                                  "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                              ]
                          )
                          []
                      ]
                  ]
              , D.ul
                  ( oneOf
                      [ D.Class !:=
                          "hidden absolute top-full left-1/2 mt-3 w-36 -translate-x-1/2 space-y-1 rounded-xl bg-white p-3 text-sm font-medium shadow-md shadow-black/5 ring-1 ring-black/5 dark:bg-slate-800 dark:ring-white/5"
                      --, D.AriaLabelledby !:= "headlessui-listbox-label-:R1j36:"
                      --, D.AriaOrientation !:= "vertical"
                      , D.Id !:= "headlessui-listbox-options-:R3j36:"
                      , D.Role !:= "listbox"
                      , D.Tabindex !:= "0"
                      , pure (xdata "headlessui-state" "open")
                      ]
                  )
                  [ D.li
                      ( oneOf
                          [ D.Class !:=
                              "flex cursor-pointer select-none items-center rounded-[0.625rem] p-1 text-sky-500"
                          , D.Id !:= "headlessui-listbox-option-:r6:"
                          , D.Role !:= "option"
                          , D.Tabindex !:= "-1"
                          --, D.AriaSelected !:= "true"
                          , pure (xdata "headlessui-state" "selected")
                          ]
                      )
                      [ D.div
                          ( D.Class !:=
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          )
                          [ D.svg
                              ( oneOf
                                  [ D.AriaHidden !:= "true"
                                  , D.ViewBox !:= "0 0 16 16"
                                  , D.Class !:= "h-4 w-4 fill-sky-400 dark:fill-sky-400"
                                  ]
                              )
                              [ D.path
                                  ( oneOf
                                      [ D.FillRule !:= "evenodd"
                                      , D.ClipRule !:= "evenodd"
                                      , D.D !:=
                                          "M7 1a1 1 0 0 1 2 0v1a1 1 0 1 1-2 0V1Zm4 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm2.657-5.657a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm-1.415 11.313-.707-.707a1 1 0 0 1 1.415-1.415l.707.708a1 1 0 0 1-1.415 1.414ZM16 7.999a1 1 0 0 0-1-1h-1a1 1 0 1 0 0 2h1a1 1 0 0 0 1-1ZM7 14a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm-2.536-2.464a1 1 0 0 0-1.414 0l-.707.707a1 1 0 0 0 1.414 1.414l.707-.707a1 1 0 0 0 0-1.414Zm0-8.486A1 1 0 0 1 3.05 4.464l-.707-.707a1 1 0 0 1 1.414-1.414l.707.707ZM3 8a1 1 0 0 0-1-1H1a1 1 0 0 0 0 2h1a1 1 0 0 0 1-1Z"
                                      ]
                                  )
                                  []
                              ]
                          ]
                      , D.div (D.Class !:= "ml-3") [ text_ "Light" ]
                      ]
                  , D.li
                      ( oneOf
                          [ D.Class !:=
                              "flex cursor-pointer select-none items-center rounded-[0.625rem] p-1 text-slate-700 dark:text-slate-400"
                          , D.Id !:= "headlessui-listbox-option-:r7:"
                          , D.Role !:= "option"
                          , D.Tabindex !:= "-1"
                          --, D.AriaSelected !:= "false"
                          , pure (xdata "headlessui-state" "")
                          ]
                      )
                      [ D.div
                          ( D.Class !:=
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          )
                          [ D.svg
                              ( oneOf
                                  [ D.AriaHidden !:= "true"
                                  , D.ViewBox !:= "0 0 16 16"
                                  , D.Class !:= "h-4 w-4 fill-slate-400"
                                  ]
                              )
                              [ D.path
                                  ( oneOf
                                      [ D.FillRule !:= "evenodd"
                                      , D.ClipRule !:= "evenodd"
                                      , D.D !:=
                                          "M7.23 3.333C7.757 2.905 7.68 2 7 2a6 6 0 1 0 0 12c.68 0 .758-.905.23-1.332A5.989 5.989 0 0 1 5 8c0-1.885.87-3.568 2.23-4.668ZM12 5a1 1 0 0 1 1 1 1 1 0 0 0 1 1 1 1 0 1 1 0 2 1 1 0 0 0-1 1 1 1 0 1 1-2 0 1 1 0 0 0-1-1 1 1 0 1 1 0-2 1 1 0 0 0 1-1 1 1 0 0 1 1-1Z"
                                      ]
                                  )
                                  []
                              ]
                          ]
                      , D.div (D.Class !:= "ml-3") [ text_ "Dark" ]
                      ]
                  , D.li
                      ( oneOf
                          [ D.Class !:=
                              "flex cursor-pointer select-none items-center rounded-[0.625rem] p-1 text-slate-700 dark:text-slate-400"
                          , D.Id !:= "headlessui-listbox-option-:r8:"
                          , D.Role !:= "option"
                          , D.Tabindex !:= "-1"
                          --, D.AriaSelected !:= "false"
                          , pure (xdata "headlessui-state" "")
                          ]
                      )
                      [ D.div
                          ( D.Class !:=
                              "rounded-md bg-white p-1 shadow ring-1 ring-slate-900/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5"
                          )
                          [ D.svg
                              ( oneOf
                                  [ D.AriaHidden !:= "true"
                                  , D.ViewBox !:= "0 0 16 16"
                                  , D.Class !:= "h-4 w-4 fill-slate-400"
                                  ]
                              )
                              [ D.path
                                  ( oneOf
                                      [ D.FillRule !:= "evenodd"
                                      , D.ClipRule !:= "evenodd"
                                      , D.D !:=
                                          "M1 4a3 3 0 0 1 3-3h8a3 3 0 0 1 3 3v4a3 3 0 0 1-3 3h-1.5l.31 1.242c.084.333.36.573.63.808.091.08.182.158.264.24A1 1 0 0 1 11 15H5a1 1 0 0 1-.704-1.71c.082-.082.173-.16.264-.24.27-.235.546-.475.63-.808L5.5 11H4a3 3 0 0 1-3-3V4Zm3-1a1 1 0 0 0-1 1v4a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H4Z"
                                      ]
                                  )
                                  []
                              ]
                          ]
                      , D.div (D.Class !:= "ml-3") [ text_ "System" ]
                      ]
                  ]
              ]
          , D.a
              ( oneOf
                  [ D.Class !:= "group"
                  -- , D.AriaLabel !:= "GitHub"
                  , D.Href !:= "https://github.com"
                  ]
              )
              [ D.svg
                  ( oneOf
                      [ D.AriaHidden !:= "true"
                      , D.ViewBox !:= "0 0 16 16"
                      , D.Class !:=
                          "h-6 w-6 fill-slate-400 group-hover:fill-slate-500 dark:group-hover:fill-slate-300"
                      ]
                  )
                  [ D.path
                      ( D.D !:=
                          "M8 0C3.58 0 0 3.58 0 8C0 11.54 2.29 14.53 5.47 15.59C5.87 15.66 6.02 15.42 6.02 15.21C6.02 15.02 6.01 14.39 6.01 13.72C4 14.09 3.48 13.23 3.32 12.78C3.23 12.55 2.84 11.84 2.5 11.65C2.22 11.5 1.82 11.13 2.49 11.12C3.12 11.11 3.57 11.7 3.72 11.94C4.44 13.15 5.59 12.81 6.05 12.6C6.12 12.08 6.33 11.73 6.56 11.53C4.78 11.33 2.92 10.64 2.92 7.58C2.92 6.71 3.23 5.99 3.74 5.43C3.66 5.23 3.38 4.41 3.82 3.31C3.82 3.31 4.49 3.1 6.02 4.13C6.66 3.95 7.34 3.86 8.02 3.86C8.7 3.86 9.38 3.95 10.02 4.13C11.55 3.09 12.22 3.31 12.22 3.31C12.66 4.41 12.38 5.23 12.3 5.43C12.81 5.99 13.12 6.7 13.12 7.58C13.12 10.65 11.25 11.33 9.47 11.53C9.76 11.78 10.01 12.26 10.01 13.01C10.01 14.08 10 14.94 10 15.21C10 15.42 10.15 15.67 10.55 15.59C13.71 14.53 16 11.53 16 8C16 3.58 12.42 0 8 0Z"
                      )
                      []
                  ]
              ]
          ]
      ]
  , D.div
      ( D.Class !:=
          "overflow-hidden bg-slate-900 dark:-mb-32 dark:mt-[-4.5rem] dark:pb-32 dark:pt-[4.5rem] dark:lg:mt-[-4.75rem] dark:lg:pt-[4.75rem]"
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
                              "A UI framework for web apps that need to be fast."
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
                                  , D.Href !:= "https://github.com/mikesol/purescript-deku"
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
                          , D.div (D.Class !:= "pl-4 pt-4")
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
                                      ( D.Class !:=
                                          "flex h-6 rounded-full bg-gradient-to-r from-sky-400/30 via-sky-400 to-sky-400/30 p-px font-medium text-sky-300"
                                      )
                                      [ D.div
                                          ( D.Class !:=
                                              "flex items-center rounded-full px-2.5 bg-slate-800"
                                          )
                                          [ text_ "cache-advance.config.js" ]
                                      ]
                                  , D.div
                                      ( D.Class !:=
                                          "flex h-6 rounded-full text-slate-500"
                                      )
                                      [ D.div
                                          ( D.Class !:=
                                              "flex items-center rounded-full px-2.5"
                                          )
                                          [ text_ "package.json" ]
                                      ]
                                  ]
                              , D.div
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
                                      , text_ "07"
                                      , D.br_ []
                                      ]
                                  , D.pre
                                      ( D.Class !:=
                                          "prism-code language-javascript flex overflow-x-auto pb-6"
                                      )
                                      [ D.code (D.Class !:= "px-4")
                                          [ D.div (D.Class !:= "token-line")
                                              [ D.span
                                                  ( D.Class !:=
                                                      "token keyword module"
                                                  )
                                                  [ text_ "export" ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token keyword module"
                                                  )
                                                  [ text_ "default" ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "{" ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              ]
                                          , D.div (D.Class !:= "token-line")
                                              [ D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token literal-property property"
                                                  )
                                                  [ text_ "strategy" ]
                                              , D.span
                                                  (D.Class !:= "token operator")
                                                  [ text_ ":" ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  (D.Class !:= "token string")
                                                  [ text_ "'predictive'" ]
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "," ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              ]
                                          , D.div (D.Class !:= "token-line")
                                              [ D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token literal-property property"
                                                  )
                                                  [ text_ "engine" ]
                                              , D.span
                                                  (D.Class !:= "token operator")
                                                  [ text_ ":" ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "{" ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              ]
                                          , D.div (D.Class !:= "token-line")
                                              [ D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token literal-property property"
                                                  )
                                                  [ text_ "cpus" ]
                                              , D.span
                                                  (D.Class !:= "token operator")
                                                  [ text_ ":" ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  (D.Class !:= "token number")
                                                  [ text_ "12" ]
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "," ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              ]
                                          , D.div (D.Class !:= "token-line")
                                              [ D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token literal-property property"
                                                  )
                                                  [ text_ "backups" ]
                                              , D.span
                                                  (D.Class !:= "token operator")
                                                  [ text_ ":" ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "[" ]
                                              , D.span
                                                  (D.Class !:= "token string")
                                                  [ text_
                                                      "'./storage/cache.wtf'"
                                                  ]
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "]" ]
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "," ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              ]
                                          , D.div (D.Class !:= "token-line")
                                              [ D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "}" ]
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "," ]
                                              , D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              ]
                                          , D.div (D.Class !:= "token-line")
                                              [ D.span
                                                  (D.Class !:= "token plain")
                                                  []
                                              , D.span
                                                  ( D.Class !:=
                                                      "token punctuation"
                                                  )
                                                  [ text_ "}" ]
                                              ]
                                          ]
                                      ]
                                  ]
                              ]
                          ]
                      ]
                  ]
              ]
          ]
      ]
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