module Components.LeftMatter where

import Prelude

import Components.Link (link)
import Contracts (Chapter(..), Page(..))
import Data.Foldable (oneOf)
import Data.Newtype (unwrap)

import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import FRP.Poll (Poll)
import Navigation (PushState)
import Pages.Docs (docs)
import Router.ADT (Route)

pageLi
  :: { pageIs :: Route -> Poll Unit
     , pageWas :: Route -> Poll Unit
     , pushState :: PushState
     }
  -> Page
  -> Nut
pageLi { pushState, pageIs, pageWas } (Page { route }) = D.li
  [ DA.klass_ "relative" ]
  [ link pushState route
      [ DA.klass $
          ( oneOf
              [ pure false
              , pageIs route $> true
              , pageWas route $> false
              ]
          ) <#>
            ( if _ then
                "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full font-semibold text-sky-500 before:bg-sky-500"
              else
                "block w-full pl-3.5 before:pointer-events-none before:absolute before:-left-1 before:top-1/2 before:h-1.5 before:w-1.5 before:-translate-y-1/2 before:rounded-full text-slate-500 before:hidden before:bg-slate-300 hover:text-slate-600 hover:before:block dark:text-slate-400 dark:before:bg-slate-700 dark:hover:text-slate-300"
            )
      ]
  ]

chapterLi
  :: { pageIs :: Route -> Poll Unit
     , pageWas :: Route -> Poll Unit
     , pushState :: PushState
     }
  -> Chapter
  -> Nut
chapterLi opts (Chapter { title, pages }) = D.li_
  [ D.h2
      [ DA.klass_
          "font-display font-medium text-slate-900 dark:text-white"
      ]
      [ text_ title ]
  , D.ul
      ( [ DA.role_ "list"
        , DA.klass_
            "mt-2 space-y-2 border-l-2 border-slate-100 dark:border-slate-800 lg:mt-4 lg:space-y-4 lg:border-slate-200"
        ]
      )
      (pageLi opts <$> pages)
  ]

leftMatter
  :: { pageIs :: Route -> Poll Unit
     , pageWas :: Route -> Poll Unit
     , pushState :: PushState
     }
  -> Nut
leftMatter opts = D.div
  [ DA.klass_ "hidden lg:relative lg:block lg:flex-none" ]
  [ D.div
      [ DA.klass_
          "absolute inset-y-0 right-0 w-[50vw] bg-slate-50 dark:hidden"
      ]
      []
  , D.div
      [ DA.klass_
          "absolute top-16 bottom-0 right-0 hidden h-12 w-px bg-gradient-to-t from-slate-800 dark:block"
      ]
      []
  , D.div
      [ DA.klass_
          "absolute top-28 bottom-0 right-0 hidden w-px bg-slate-800 dark:block"
      ]
      []
  , D.div
      [ DA.klass_
          "sticky top-[4.5rem] -ml-0.5 h-[calc(100vh-4.5rem)] overflow-y-auto overflow-x-hidden py-16 pl-0.5"
      ]
      [ D.nav
          [ DA.klass_
              "text-base lg:text-sm w-64 pr-8 xl:w-72 xl:pr-16"
          ]
          [ D.ul ([ DA.role_ "list", DA.klass_ "space-y-9" ])
              (chapterLi opts <$> unwrap docs)
          ]
      ]
  ]