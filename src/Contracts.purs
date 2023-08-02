module Contracts where

import Prelude

import Control.Monad.Free (Free, liftF)
import Data.Array (intercalate)
import Data.Newtype (class Newtype)
import Data.String (Pattern(..), split, toLower)
import Deku.Core (Nut)
import Record (union)
import Router.ADT (Route, routeToTitle)

newtype Env = Env
  { routeLink :: Route -> Nut
  , routeLinkWithText ::
      Route -> String -> Nut
  }

newtype Docs = Docs (Array (Chapter))

derive instance Newtype (Docs) _
newtype Chapter = Chapter
  { title :: String, path :: String, pages :: Array (Page) }

derive instance Newtype (Chapter) _

chapter
  :: { title :: String
     , pages :: Array (Page)
     }
  -> Chapter
chapter i = Chapter
  ( i `union`
      { path: "/" <>
          (intercalate "-" $ map toLower $ split (Pattern " ") i.title)
      }
  )

newtype Page = Page
  { path :: String
  , title :: String
  , route :: Route
  , topmatter :: Content (Array Nut)
  , sections :: Array (Section)
  }

derive instance Newtype (Page) _

page
  :: { route :: Route
     , topmatter :: Content (Array Nut)
     , sections :: Array (Section)
     }
  -> Page
page i = Page
  ( i `union`
      { title
      , path: "/" <>
          (intercalate "-" $ map toLower $ split (Pattern " ") title)
      }
  )
  where
  title = routeToTitle i.route

newtype Section = Section
  { title :: String
  , id :: String
  , topmatter :: Content (Array Nut)
  , subsections :: Array (Subsection)
  }

section
  :: { title :: String
     , topmatter :: Content (Array Nut)
     , subsections :: Array (Subsection)
     }
  -> Section
section i = Section
  ( i `union`
      { id: intercalate "-" $ map toLower $ split (Pattern " ") i.title }
  )

data ContentF a
  = GetEnv (Env -> a)
  | GetRandomNumber (Number -> a)

getEnv :: Content Env
getEnv = liftF $ GetEnv identity

getRandomNumber :: Content Number
getRandomNumber = liftF $ GetRandomNumber identity

type Content = Free ContentF

derive instance Functor ContentF

newtype Subsection = Subsection
  { title :: String
  , id :: String
  , matter :: Content (Array Nut)
  }

subsection
  :: { title :: String
     , matter :: Content (Array Nut)
     }
  -> Subsection
subsection i = Subsection
  ( i `union`
      { id: intercalate "-" $ map toLower $ split (Pattern " ") i.title }
  )