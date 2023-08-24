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
import Foreign (Foreign)
import Router.ADT (Route(..))
import Router.Chapter (routeToChapter)
import Router.Page (routeToPage)
import Web.Event.Event (preventDefault)
import Web.HTML (window)
import Web.HTML.Window (scroll)
import Web.PointerEvent.PointerEvent (PointerEvent, toEvent)
import Yoga.JSON as JSON

link''
  :: forall a19 a26
   . Discard a19
  => Discard a26
  => (PointerEvent -> Effect a19)
  -> (Foreign -> String -> Effect a26)
  -> Route
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())
           )
       )
  -> Array Nut
  -> Nut
link'' eff pushState route attributes children = D.a
  ( attributes <>
      [ DA.href_ url
      , DL.click_ \e -> do
          eff e
          preventDefault (toEvent e)
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
  :: (Foreign -> String -> Effect Unit)
  -> Route
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
  :: (Foreign -> String -> Effect Unit)
  -> Route
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())

           )
       )
  -> Nut
link pushState route attributes = link' pushState route attributes
  [ text_ page.title ]
  where
  Page page = routeToPage route

linkWithString
  :: (Foreign -> String -> Effect Unit)
  -> Route
  -> String
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())
           )
       )
  -> Nut
linkWithString pushState route title attributes = link' pushState route
  attributes
  [ text_ title ]

linkWithNut
  :: (Foreign -> String -> Effect Unit)
  -> Route
  -> Array Nut
  -> Array
       ( Poll
           ( Attribute
               (HTMLAnchorElement ())
           )
       )
  -> Nut
linkWithNut pushState route title attributes = link' pushState route
  attributes title