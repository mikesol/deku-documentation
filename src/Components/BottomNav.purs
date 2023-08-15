module Components.BottomNav where

import Prelude

import Components.Link (link')
import Data.Maybe (Maybe, maybe)
import Data.Newtype (unwrap)
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
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
    [ klass
        "mt-12 flex border-t border-slate-200 pt-6 dark:border-slate-800"
    ]
    ( ( prevRoute # maybe [] \pr ->
          [ D.div_
              [ D.dt
                  [ klass
                      "font-display text-sm font-medium text-slate-900 dark:text-white"
                  ]
                  [ text_ "Previous" ]
              , D.dd [ klass_ "mt-1" ]
                  [ link' pushState pr
                      [ klass
                          "text-base font-semibold text-slate-500 hover:text-slate-600 dark:text-slate-400 dark:hover:text-slate-300"
                      ]
                      [ D.span_ [ text_ "←" ]
                      , text (unwrap (routeToPage pr)).title
                      ]
                  ]
              ]
          ]
      ) <>
        ( nextRoute # maybe [] \nr ->
            [ D.div [ klass_ "ml-auto text-right" ]
                [ D.dt
                    [ klass
                        "font-display text-sm font-medium text-slate-900 dark:text-white"
                    ]
                    [ text_ "Next" ]
                , D.dd [ klass_ "mt-1" ]
                    [ link' pushState nr
                        [ klass
                            "text-base font-semibold text-slate-500 hover:text-slate-600 dark:text-slate-400 dark:hover:text-slate-300"
                        ]
                        [ text (unwrap (routeToPage nr)).title
                        , D.span_ [ text_ "→" ]
                        ]
                    ]
                ]
            ]
        )
    )