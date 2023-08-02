module Examples.RowPolymorphismAndProviders where

import Prelude
import ExampleAssitant (ExampleSignature)

import Control.Monad.Reader (ask, asks)
import Data.Newtype (class Newtype, unwrap)
import Deku.Control (text)
import Deku.Core (Nut)
import Deku.DOM as D

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

main :: ExampleSignature
main runExample = runExample Deku.do
  let
    cont = do
      lg <- libGreat
      Env { interjection } <- ask
      pure $ D.div_
        ( [ D.div_ [ text interjection ]
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
    pure $ D.div_ [ text "In all honesty...", awe ]