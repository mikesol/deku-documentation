module Components.BottomNav where

import Prelude


import Prelude

import Components.Link (link')
import Data.Foldable (oneOf)
import Data.Maybe (Maybe, maybe)
import Data.Newtype (unwrap)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Navigation (PushState)
import Router.ADT (Route)
import Router.Page (routeToPage)

bottomNav
  :: forall lock payload
   . { nextRoute :: Maybe Route
     , prevRoute :: Maybe Route
     , pushState :: PushState
     }
  -> Domable lock payload
bottomNav { nextRoute, prevRoute, pushState } =
  D.dl
    ( D.Class !:=
        "mt-12 flex border-t border-slate-200 pt-6 dark:border-slate-800"
    )
    ( ( prevRoute # maybe [] \pr ->
          [ D.div_
              [ D.dt
                  ( D.Class !:=
                      "font-display text-sm font-medium text-slate-900 dark:text-white"
                  )
                  [ text_ "Previous" ]
              , D.dd (D.Class !:= "mt-1")
                  [ link' pushState pr
                      ( oneOf
                          [ D.Class !:=
                              "text-base font-semibold text-slate-500 hover:text-slate-600 dark:text-slate-400 dark:hover:text-slate-300"
                          ]
                      )
                      [ D.span_ [ text_ "←" ]
                      , text_ (unwrap (routeToPage pr)).title
                      ]
                  ]
              ]
          ]
      ) <>
        ( nextRoute # maybe [] \nr ->
            [ D.div (D.Class !:= "ml-auto text-right")
                [ D.dt
                    ( D.Class !:=
                        "font-display text-sm font-medium text-slate-900 dark:text-white"
                    )
                    [ text_ "Next" ]
                , D.dd (D.Class !:= "mt-1")
                    [ link' pushState nr
                        ( oneOf
                            [ D.Class !:=
                                "text-base font-semibold text-slate-500 hover:text-slate-600 dark:text-slate-400 dark:hover:text-slate-300"
                            ]
                        )
                        [ text_ (unwrap (routeToPage nr)).title
                        , D.span_ [ text_ "→" ]
                        ]
                    ]
                ]
            ]
        )
    )