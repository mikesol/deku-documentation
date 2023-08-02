module Components.BottomNav where

import Prelude

import Components.Link (link')
import Data.Maybe (Maybe, maybe)
import Data.Newtype (unwrap)
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.Core (Nut)
import Deku.DOM as D
import Navigation (PushState)
import Router.ADT (Route)
import Router.Page (routeToPage)

bottomNav
  :: { nextRoute :: Maybe Route
     , prevRoute :: Maybe Route
     , pushState :: PushState
     }
  -> Nut
bottomNav { nextRoute, prevRoute, pushState } =
  D.dl
    [ D.Class :=
        "mt-12 flex border-t border-slate-200 pt-6 dark:border-slate-800"
    ]
    ( ( prevRoute # maybe [] \pr ->
          [ D.div_
              [ D.dt
                  [ D.Class :=
                      "font-display text-sm font-medium text-slate-900 dark:text-white"
                  ]
                  [ text "Previous" ]
              , D.dd [ D.Class := "mt-1" ]
                  [ link' pushState pr
                      ( D.Class :=
                          "text-base font-semibold text-slate-500 hover:text-slate-600 dark:text-slate-400 dark:hover:text-slate-300"
                      )
                      [ D.span_ [ text "←" ]
                      , text (unwrap (routeToPage pr)).title
                      ]
                  ]
              ]
          ]
      ) <>
        ( nextRoute # maybe [] \nr ->
            [ D.div [ D.Class := "ml-auto text-right" ]
                [ D.dt
                    [ D.Class :=
                        "font-display text-sm font-medium text-slate-900 dark:text-white"
                    ]
                    [ text "Next" ]
                , D.dd [ D.Class := "mt-1" ]
                    [ link' pushState nr
                        ( D.Class :=
                            "text-base font-semibold text-slate-500 hover:text-slate-600 dark:text-slate-400 dark:hover:text-slate-300"
                        )
                        [ text (unwrap (routeToPage nr)).title
                        , D.span_ [ text "→" ]
                        ]
                    ]
                ]
            ]
        )
    )