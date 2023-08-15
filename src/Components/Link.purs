module Components.Link where

import Prelude

import Contracts (Chapter(..), Page(..))
import Deku.Attribute (Attribute, cb, (:=))
import Deku.Control (text, text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.Listeners (click, click_)
import Effect (Effect)
import Navigation (PushState)
import Router.ADT (Route(..))
import Router.Chapter (routeToChapter)
import Router.Page (routeToPage)
import Web.Event.Event (preventDefault)
import Web.Event.Internal.Types as Web
import Web.HTML (window)
import Web.HTML.Window (scroll)
import Yoga.JSON as JSON

link''
  :: (Web.Event -> Effect Unit)
  -> PushState
  -> Route
  -> Array (Attribute D.A_)
  -> Array Nut
  -> Nut
link'' eff pushState route attributes children = D.a
  ( attributes <>
      [ D.Href := url
      , click $ cb \e -> do
          eff e
          preventDefault e
          pushState (JSON.writeImpl {}) url
          window >>= scroll 0 0
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
  :: PushState
  -> Route
  -> Array (Attribute D.A_)
  -> Array Nut
  -> Nut
link' = link'' (const (pure unit))

link
  :: PushState
  -> Route
  -> Array (Attribute D.A_)
  -> Nut
link pushState route attributes = link' pushState route attributes
  [ text page.title ]
  where
  Page page = routeToPage route

linkWithString
  :: PushState
  -> Route
  -> String
  -> Array (Attribute D.A_)
  -> Nut
linkWithString pushState route title attributes = link' pushState route
  attributes
  [ text title ]