module Components.Link where

import Prelude

import Contracts (Chapter(..), Page(..))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM (Attribute, HTMLAnchorElement)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Effect (Effect)
import FRP.Poll (Poll)
import Router.ADT (Route(..))
import Router.Chapter (routeToChapter)
import Router.Page (routeToPage)
import Web.PointerEvent.PointerEvent (PointerEvent)

link''
  :: (PointerEvent -> Effect Unit)
  -> Route
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())
           )
       )
  -> Array Nut
  -> Nut
link'' eff route attributes children = D.a
  ( attributes <>
      [ DA.href_ url
      , DL.click_ eff
      ]
  )

  children
  where
  Chapter chapter = routeToChapter route
  Page page = routeToPage route
  url =
    if page.route == GettingStarted then "/"
    else chapter.path <> page.path

link'
  :: Route
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())

           )
       )
  -> Array Nut
  -> Nut
link' = link'' (const (pure unit))

link
  :: Route
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())
           )
       )
  -> Nut
link route attributes = link' route attributes
  [ text_ page.title ]
  where
  Page page = routeToPage route

linkWithString
  :: Route
  -> String
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())
           )
       )
  -> Nut
linkWithString route title attributes = link' route
  attributes
  [ text_ title ]

linkWithNut
  :: Route
  -> Array Nut
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())
           )
       )
  -> Nut
linkWithNut route title attributes = link' route
  attributes
  title