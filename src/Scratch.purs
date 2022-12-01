module Scratch where

import Prelude

import Control.Monad.Reader (ask, asks)
import Data.Newtype (class Newtype, unwrap)
import Deku.Control (text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)

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

main :: Effect Unit
main = runInBody Deku.do
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
