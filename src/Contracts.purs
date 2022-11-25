module Contracts where

import Prelude

import Data.Array (intercalate)
import Data.Newtype (class Newtype)
import Data.String (Pattern(..), split, toLower)
import Deku.Core (Domable)
import Record (union)
import Router.ADT (Route, routeToTitle)

newtype Docs lock paylaod = Docs (Array (Chapter lock paylaod))

derive instance Newtype (Docs lock paylaod) _
newtype Chapter lock payload = Chapter
  { title :: String, path :: String, pages :: Array (Page lock payload) }

derive instance Newtype (Chapter lock paylaod) _

chapter
  :: forall lock payload
   . { title :: String
     , pages :: Array (Page lock payload)
     }
  -> Chapter lock payload
chapter i = Chapter
  ( i `union`
      { path: "/" <>
          (intercalate "-" $ map toLower $ split (Pattern " ") i.title)
      }
  )

type Page' lock payload r =
  { path :: String
  , title :: String
  , route :: Route
  , topmatter :: Array (Domable lock payload)
  , sections :: Array (Section lock payload)
  | r
  }

newtype Page lock payload = Page (Page' lock payload ())
type FullPage lock payload = Page' lock payload (showBanner :: Boolean)

page
  :: forall lock payload
   . { route :: Route
     , topmatter :: Array (Domable lock payload)
     , sections :: Array (Section lock payload)
     }
  -> Page lock payload
page i = Page
  ( i `union`
      { title
      , path: "/" <>
          (intercalate "-" $ map toLower $ split (Pattern " ") title)
      }
  )
  where
  title = routeToTitle i.route

newtype Section lock payload = Section
  { title :: String
  , id :: String
  , topmatter :: Array (Domable lock payload)
  , subsections :: Array (Subsection lock payload)
  }

section
  :: forall lock payload
   . { title :: String
     , topmatter :: Array (Domable lock payload)
     , subsections :: Array (Subsection lock payload)
     }
  -> Section lock payload
section i = Section
  ( i `union`
      { id: intercalate "-" $ map toLower $ split (Pattern " ") i.title }
  )

newtype Subsection lock payload = Subsection
  { title :: String, id :: String, matter :: Array (Domable lock payload) }

subsection
  :: forall lock payload
   . { title :: String
     , matter :: Array (Domable lock payload)
     }
  -> Subsection lock payload
subsection i = Subsection
  ( i `union`
      { id: intercalate "-" $ map toLower $ split (Pattern " ") i.title }
  )