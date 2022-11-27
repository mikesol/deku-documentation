module Components.Link where

import Prelude


import Prelude

import Contracts (Chapter(..), Page(..))
import Control.Alt ((<|>))
import Data.Foldable (oneOf)
import Deku.Attribute (Attribute, cb, (!:=))
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Listeners (click_)
import Effect (Effect)
import FRP.Event (Event)
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
  :: forall lock payload
   . (Web.Event -> Effect Unit)
  -> PushState
  -> Route
  -> Event (Attribute D.A_)
  -> Array (Domable lock payload)
  -> Domable lock payload
link'' eff pushState route attributes children = D.a
  ( attributes <|> oneOf
      [ D.Href !:= url
      , click_ $ cb \e -> do
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
  :: forall lock payload
   . PushState
  -> Route
  -> Event (Attribute D.A_)
  -> Array (Domable lock payload)
  -> Domable lock payload
link' = link'' (const (pure unit))

link
  :: forall lock payload
   . PushState
  -> Route
  -> Event (Attribute D.A_)
  -> Domable lock payload
link pushState route attributes = link' pushState route attributes
  [ text_ page.title ]
  where
  Page page = routeToPage route