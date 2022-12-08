module Pages.CoreConcepts.Providers.RowPolymorphism.RowPolymorphismAndProviders where

import Prelude

import Components.Code (psCodeNoCollapseWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Monad.Reader (ask, asks)
import Data.Newtype (class Newtype, unwrap)
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Examples as Examples

libAwesome
  :: forall n r lock payload
   . Newtype n
       { libAwesome ::
           { s1 :: String
           , s2 :: String
           , cont :: n -> Domable lock payload
           }
       | r
       }
  => n
  -> Domable lock payload
libAwesome = do
  { libAwesome: { s1, s2, cont } } <- asks unwrap
  c <- cont
  pure $ D.div_
    [ D.div__ ("Lib awesome says: " <> s1)
    , D.div__ ("Lib awesome also says: " <> s2)
    , c
    ]

libGreat
  :: forall n r lock payload
   . Newtype n
       { libGreat ::
           { x1 :: String }
       | r
       }
  => n
  -> Domable lock payload
libGreat = do
  { libGreat: { x1 } } <- asks unwrap
  pure $ D.div_
    [ D.div__ ("Lib great says: " <> x1)
    ]

newtype Env lock payload = Env
  { libGreat ::
      { x1 :: String }
  , libAwesome ::
      { s1 :: String
      , s2 :: String
      , cont :: Env lock payload -> Domable lock payload
      }
  , interjection :: String
  }

derive instance Newtype (Env lock payload) _

rowPolymorphismAndProviders :: forall lock payload. Subsection lock payload
rowPolymorphismAndProviders = subsection
  { title: "Row polymorphism and providers"
  , matter: pure
      [ D.p_
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
      , D.p__ "Here's the code."
      , psCodeNoCollapseWithLink Examples.RowPolymorphismAndProviders
      , D.p__ "And here's the result."
      , exampleBlockquote
          [ Deku.do
              let
                cont = do
                  lg <- libGreat
                  Env { interjection } <- ask
                  pure $ D.div_
                    ( [ D.div_ [ text_ interjection ]
                      , lg
                      ]
                    )
              Env
                { interjection: "Oh and..."
                , libAwesome:
                    { s1: "I'm awesome!"
                    , s2: "Heck yeah!"
                    , cont
                    }
                , libGreat: { x1: "I'm great!" }
                } # do
                awe <- libAwesome
                pure $ D.div_ [ text_ "In all honesty...", awe ]
          ]
      , D.p_
          [ text_ "By using Row Polymorphism, both "
          , D.code__ "libGreat"
          , text_ " and "
          , D.code__ "libAwesome"
          , text_
              " are able to exist in the Deku tree without knowing anything about the environment into which they're inserted "
          , D.i__ "except"
          , text_
              " that which concerns their own dependencies. So long as their dependencies are present, they compile."
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
              "s allow you to use recursive Row Polymorphism in a library without committing to a concrete type upfront. Armed with this knowledge, you'll be able to create all sorts of neat Deku libraries. I expect to see the market flooded with image carousel implementations any day now!"
          ]
      ]
  }
