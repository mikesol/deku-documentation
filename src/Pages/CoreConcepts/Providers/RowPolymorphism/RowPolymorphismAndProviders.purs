module Pages.CoreConcepts.Providers.RowPolymorphism.RowPolymorphismAndProviders where

import Prelude

import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Control.Monad.Reader (asks)
import Data.Maybe (Maybe(..))
import Data.Newtype (class Newtype, unwrap)
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Examples as Examples

libAwesome
  :: forall n r
   . Newtype n
       { libAwesome ::
           { s1 :: String
           , s2 :: String
           , cont :: n -> Nut
           }
       | r
       }
  => n
  -> Nut
libAwesome = do
  { libAwesome: { s1, s2, cont } } <- asks unwrap
  c <- cont
  pure $ D.div_
    [ D.div__ ("Lib awesome says: " <> s1)
    , D.div__ ("Lib awesome also says: " <> s2)
    , c
    ]

libGreat
  :: forall n r
   . Newtype n
       { libGreat ::
           { x1 :: String }
       | r
       }
  => n
  -> Nut
libGreat = do
  { libGreat: { x1 } } <- asks unwrap
  pure $ D.div_
    [ D.div__ ("Lib great says: " <> x1)
    ]

newtype Env = Env
  { libGreat ::
      { x1 :: String }
  , libAwesome ::
      { s1 :: String
      , s2 :: String
      , cont :: Env -> Nut
      }
  , interjection :: String
  }

derive instance Newtype (Env) _

rowPolymorphismAndProviders :: Subsection
rowPolymorphismAndProviders = subsection
  { title: "Row polymorphism and providers"
  , matter: do
      example <- getExample StartExapanded Nothing Examples.RowPolymorphismAndProviders
      pure [ D.p_
          [ text_
              "Now that we've explored what Row Polymorphism looks like, let's see it in the case of a Deku provider. We'll explore two scenarios:"
          ]
      , D.ol_
          [ D.li_
              [ text_ "A third-party library called "
              , D.code__ "libGreat"
              , text_ " that's a terminal node in our Deku tree."
              ]
          , D.li_
              [ text_ "A third-party library called "
              , D.code__ "libAwesome"
              , text_ " that's an intermediary node in our Deku tree."
              ]
          ]
      , D.p__ "Here's the example."
      , example
      , D.p_
          [ text_ "By using Row Polymorphism, both "
          , D.code__ "libGreat"
          , text_ " and "
          , D.code__ "libAwesome"
          , text_
              " are able to exist in the Deku tree without knowing much about the environment into which they're inserted aside from the fact that it's a "
          , D.code__ "Record"
          , text_ " in a "
          , D.code__ "newtype"
          , text_ ". So long as their dependencies are present, they compile."
          ]
      , D.p_
          [ text_ "Because "
          , D.code__ "libAwesome"
          , text_
              " refers to additional nodes in the Deku tree, it must provide an environment to these nodes. However, because it cannot know the type of this environment, we're in a bind. Enter the "
          , D.code__ "Newtype"
          , text_ " constraint. "
          , D.code__ "Newtype"
          , text_
              "s allow you to use recursive Row Polymorphism in a library without committing to a concrete type upfront. Armed with this knowledge, you'll be able to create all sorts of neat Deku libraries. I expect to see the market flooded with Deku image carousel implementations any day now!"
          ]
      ]
  }
