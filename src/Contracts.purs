module Contracts where

import Prelude

import Components.Code (psCodeNoCollapseWithLink, psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote, exampleBlockquoteWithHeight)
import Control.Monad.Free (Free, liftF)
import Control.Monad.Writer (WriterT(..), lift)
import Data.Array (intercalate)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype)
import Data.String (Pattern(..), split, toLower)
import Data.Tuple (Tuple(..))
import Deku.Core (Nut, fixed)
import Effect (Effect)
import Effect.Random (random)
import Effect.Ref (new, read, write)
import Examples (ExampleADT, exampleToApp)
import Record (union)
import Router.ADT (Route, routeToTitle)

newtype Env = Env
  { routeLink :: Route -> Nut
  , routeLinkWithText :: Route -> String -> Nut
  , routeLinkWithNuts :: Route -> Array Nut -> Nut
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
  | GetExample CollapseState (Maybe String) ExampleADT (Nut -> a)

type WTEffectWithCancellers = WriterT (Effect Unit) Effect
type EffectWithCancellers a = Effect (Tuple a (Effect Unit))

contentToPoll :: Env -> ContentF ~> WTEffectWithCancellers
contentToPoll env = case _ of
  GetEnv f -> pure $ f env
  GetRandomNumber f -> f <$> lift random
  GetExample b k e f -> do
    let
      m = WriterT do
        i <- new mempty
        u <- exampleToApp e (\w -> write w i *> mempty)
        n <- read i
        pure $ (flip Tuple) u $ fixed
          [ e #
              case b of
                StartCollapsed -> psCodeWithLink
                StartExpanded -> psCodeNoCollapseWithLink
          , case k of
              Just x -> exampleBlockquoteWithHeight x [ n ]
              Nothing -> exampleBlockquote [ n ]
          ]
    f <$> m

getEnv :: Content Env
getEnv = liftF $ GetEnv identity

getRandomNumber :: Content Number
getRandomNumber = liftF $ GetRandomNumber identity

data CollapseState = StartCollapsed | StartExpanded

getExample :: CollapseState -> Maybe String -> ExampleADT -> Content Nut
getExample b k e = liftF $ GetExample b k e identity

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