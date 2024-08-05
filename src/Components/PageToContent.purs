module Components.PageToContent where

import Prelude

import Contracts (Content, Page(..), Section(..), Subsection(..))
import Control.Monad.State (evalStateT, get, lift, put)
import Data.Newtype (unwrap)
import Data.Traversable (traverse)
import Data.Tuple (Tuple(..))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Self as Self
import Effect (Effect)
import Prism (forceHighlightAff)
import Router.ADT (Route(..))
import Router.Chapter (routeToChapter)
import Web.DOM as Web.DOM

pageToContent ::  ((Tuple Int Web.DOM.Element) -> Effect Unit) -> Page -> Content Nut
pageToContent setRightSideNav (Page cp) = do
  tp <- cp.topmatter
  sections <- flip evalStateT 0
    ( traverse
        ( \(Section section) -> do
            i <- get
            put (i + 1)
            stm <- lift section.topmatter
            inner <- traverse
              ( \(Subsection subsection) ->
                  do
                    j <- get
                    put (j + 1)
                    smat <- lift subsection.matter
                    pure
                      ( [ D.h3
                            ( [ DA.id_ subsection.id
                              , Self.self_ $ Tuple j >>> setRightSideNav
                              ]
                            )
                            [ text_ subsection.title
                            ]
                        ] <> smat
                      )
              )
              section.subsections
            pure
              ( [ D.hr_ []
                , D.h2
                    ( [ DA.id_ section.id
                      , Self.self_
                          $ Tuple i >>>
                              setRightSideNav
                      ]
                    )
                    [ text_ section.title ]

                ] <> stm <> join inner
              )
        )
        cp.sections
    )
  pure $ D.article_
    [ D.header
        ( [ DA.klass_ "mb-9 space-y-1"
          ]
        )
        ( ( if cp.route == FourOhFour then []
            else
              [ D.p
                  ( [ DA.klass_
                        "font-display text-sm font-medium text-sky-500"
                    ]
                  )
                  [ text_
                      (unwrap (routeToChapter cp.route)).title
                  ]
              ]
          ) <>
            [ D.h1
                ( [ DA.id_ "getting-started"
                  , DA.klass_
                      "font-display text-3xl tracking-tight text-slate-900 dark:text-white"
                  ]
                )
                [ text_ cp.title ]
            ]
        )
    , D.div
        ( [ DA.klass_
              "prose prose-slate max-w-none dark:prose-invert dark:text-slate-400 prose-headings:scroll-mt-28 prose-headings:font-display prose-headings:font-normal lg:prose-headings:scroll-mt-[8.5rem] prose-lead:text-slate-500 dark:prose-lead:text-slate-400 prose-a:font-semibold dark:prose-a:text-sky-400 prose-a:no-underline prose-a:shadow-[inset_0_-2px_0_0_var(--tw-prose-background,#fff),inset_0_calc(-1*(var(--tw-prose-underline-size,4px)+2px))_0_0_var(--tw-prose-underline,theme(colors.sky.300))] hover:prose-a:[--tw-prose-underline-size:6px] dark:[--tw-prose-background:theme(colors.slate.900)] dark:prose-a:shadow-[inset_0_calc(-1*var(--tw-prose-underline-size,2px))_0_0_var(--tw-prose-underline,theme(colors.sky.800))] dark:hover:prose-a:[--tw-prose-underline-size:6px] prose-pre:rounded-xl prose-pre:bg-slate-900 prose-pre:shadow-lg dark:prose-pre:bg-slate-800/60 dark:prose-pre:shadow-none dark:prose-pre:ring-1 dark:prose-pre:ring-slate-300/10 dark:prose-hr:border-slate-800"
          ]
        )
        (tp <> join sections)
    , forceHighlightAff
    ]
