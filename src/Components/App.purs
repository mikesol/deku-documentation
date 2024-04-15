module Components.App where

import Prelude

import Components.Banner (banner)
import Components.BottomNav (bottomNav)
import Components.Header (header)
import Components.LeftMatter (leftMatter)
import Contracts (Env, Page(..), Section(..), Subsection(..))
import Control.Monad.State (evalState, get, put, runState)
import DarkModePreference (DarkModePreference(..))
import Data.Maybe (Maybe(..))
import Data.Traversable (oneOf, traverse)
import Data.Tuple (Tuple(..), fst, snd)
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (cycle, useState, (<#~>))
import Effect (Effect)
import Effect.Ref as Ref
import FRP.Poll (Poll)
import Navigation (PushState)
import Router.ADT (Route(..))
import Router.RouteOrder (routeToNextRoute, routeToPrevRoute)
import Web.DOM as DOM

app
  :: { setHeaderElement :: DOM.Element -> Effect Unit
     , rightSideNavSelect :: Int -> Poll Unit
     , rightSideNavDeselect :: Int -> Poll Unit
     , darkModePreference :: Poll Boolean
     , curPage :: Poll Page
     , curNut :: Poll Nut
     , showBanner :: Poll Boolean
     , pageIs :: Route -> Poll Unit
     , pageWas :: Route -> Poll Unit
     , pushState :: PushState
     , clickedSection :: Ref.Ref (Maybe Int)
     , env :: Env
     }
  -> Nut
app
  { setHeaderElement
  , curPage
  , curNut
  , rightSideNavSelect
  , rightSideNavDeselect
  , darkModePreference
  , showBanner
  , pageIs
  , pageWas
  , pushState
  , clickedSection
  } = Deku.do
  setDark /\ dark <- useState LightMode
  let
    darkBoolean =
      ( Tuple <$> darkModePreference <*> dark
      ) <#> \(dmPref /\ dk) ->
        case dk of
          DarkMode -> true
          LightMode -> false
          SystemDarkModePreference -> dmPref

  let
    rightSideNavClass' darktxt i =
      ( oneOf
          [ pure false
          , rightSideNavSelect i $> true
          , rightSideNavDeselect i $> false
          ]
      )
        <#>
          if _ then "text-sky-500"
          else "hover:text-slate-600 " <> darktxt <>
            " dark:hover:text-slate-300"

    rightSideNavClass = rightSideNavClass' "dark:text-white"
    rightSideSubNavClass = rightSideNavClass' "dark:text-slate-400"
  D.div
    ( [ DA.klass $ darkBoolean <#> if _ then "dark" else ""
      ]
    )
    [ D.div ([ DA.klass_ "bg-white dark:bg-slate-900" ])
        [ header
            { pushState
            , darkBoolean
            , dark
            , setDark
            , setHeaderElement
            , pageIs
            , pageWas
            }
        , banner { showBanner }
        , D.div
            ( [ DA.klass_
                  "relative mx-auto flex max-w-8xl justify-center sm:px-2 lg:px-8 xl:px-12"
              ]
            )
            [ leftMatter { pushState, pageIs, pageWas }
            , D.div
                [ DA.klass_
                    "min-w-0 max-w-2xl flex-auto px-4 py-16 lg:max-w-none lg:pr-0 lg:pl-8 xl:px-16"
                ]
                [ cycle curNut
                , curPage <#~> \(Page cp) -> bottomNav
                    { pushState
                    , prevRoute: routeToPrevRoute cp.route
                    , nextRoute: routeToNextRoute cp.route
                    }
                ]
            , D.div
                [ DA.klass_
                    "hidden xl:sticky xl:top-[4.5rem] xl:-mr-6 xl:block xl:h-[calc(100vh-4.5rem)] xl:flex-none xl:overflow-y-auto xl:py-16 xl:pr-6"
                ]
                [ curPage <#~> \(Page cp) ->
                    if cp.route == FourOhFour then mempty
                    else D.nav
                      ( [ DA.klass_ "w-56" ]
                      )
                      [ D.h2
                          ( [ DA.id_ "on-this-page-title"
                            , DA.klass_
                                "font-display text-sm font-medium text-slate-900 dark:text-white"
                            ]
                          )
                          [ text_ "On this page" ]
                      , D.ol
                          ( [ DA.role_ "list"
                            , DA.klass_ "mt-4 space-y-3 text-sm"
                            ]
                          )
                          ( flip evalState 0
                              $ traverse
                                  ( \(Section section) -> do
                                      i <- get
                                      let
                                        inner = flip runState (i + 1)
                                          ( traverse
                                              ( \(Subsection subsection) -> do
                                                  j <- get
                                                  put (j + 1)
                                                  pure $ D.li_
                                                    [ D.a
                                                        ( [ DA.klass
                                                              ( rightSideSubNavClass
                                                                  j
                                                              )
                                                          , DA.href_
                                                              ( "#" <>
                                                                  subsection.id
                                                              )
                                                          , DL.click_ \_ ->
                                                              ( Ref.write
                                                                  (Just j)
                                                                  clickedSection
                                                              )
                                                          ]
                                                        )
                                                        [ text_
                                                            subsection.title
                                                        ]
                                                    ]
                                              )
                                              section.subsections
                                          )
                                      put (snd inner)
                                      pure $ D.li_
                                        ( [ D.h3_
                                              [ D.a
                                                  ( ( [ DA.klass
                                                          ( rightSideNavClass
                                                              i
                                                          )
                                                      , DA.href_
                                                          ("#" <> section.id)
                                                      , DL.click_ \_ ->
                                                          ( Ref.write (Just i)
                                                              clickedSection
                                                          )
                                                      ]
                                                    )
                                                  )
                                                  [ text_ section.title ]
                                              ]
                                          , D.ol
                                              ( [ DA.role_ "list"
                                                , DA.klass_
                                                    "mt-2 space-y-3 pl-5 text-slate-500 dark:text-slate-400"
                                                ]
                                              )
                                              (fst inner)
                                          ]
                                        )
                                  )
                                  cp.sections
                          )
                      ]
                ]
            ]
        ]
    ]