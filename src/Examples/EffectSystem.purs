module Examples.EffectSystem where

import Prelude

import Control.Monad.Free (Free, liftF, resume)
import Data.Array (replicate)
import Data.Either (Either(..))
import Data.Traversable (sequence)
import Data.Tuple (Tuple(..))
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (cycle, useState)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Event (mapAccum)

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

data MyFx a = Reader (Int -> a) | Increment (Unit -> a)

derive instance Functor MyFx

ask :: Free MyFx Int
ask = liftF $ Reader identity

increment :: Free MyFx Unit
increment = liftF $ Increment identity

cbx :: Free MyFx Nut
cbx = do
  increment
  pure $ D.input
    [ DA.xtypeCheckbox
    ]
    []

nuts :: Free MyFx Nut
nuts = do
  i <- ask
  boxes <- sequence (replicate (i + 1) cbx)
  pure $ D.div_
    [ D.p_
        [ text_ "There "
        , text_ $ if i == 1 then "was " else "were "
        , text_ $ show i
        , text_ $ if i == 1 then " checkbox " else " checkboxes "
        , text_ " in the previous frame."
        ]
    , D.div_ boxes
    ]

fx ∷ Int -> Free MyFx ~> Tuple Int
fx a = go a
  where
  go n = resume >>> case _ of
    Left (Reader f) -> go n (f a)
    Left (Increment f) -> go (n + 1) (f unit)
    Right o -> Tuple n o

app :: ExampleSignature
app runExample = runExample Deku.do
  setThunk /\ thunk <- useState unit
  D.div_
    [ D.button
        [ DA.klass_ buttonClass
        , DL.click_ \_ -> setThunk unit
        ]
        [ text_ "Change content" ]
    , cycle (mapAccum fx 0 (thunk $> nuts))
    ]

main :: Effect Unit
main = void $ app $ map pure runInBody