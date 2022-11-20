module Components.OnThisPage where

import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D

onThisPage :: Nut
onThisPage = D.div
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