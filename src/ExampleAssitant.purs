module ExampleAssitant where

import Prelude

import Deku.Core (Nut)
import Effect (Effect)

type ExampleSignature =
  forall r
   . { t :: Nut -> Effect (Effect Unit)
     | r
     }
  -> Effect (Effect Unit)

type ExampleSignatureWithCancellation =
  forall r
   . { h :: Effect Unit -> Nut -> Effect (Effect Unit)
     | r
     }
  -> Effect (Effect Unit)

type FullExampleSignature =
  { t :: Nut -> Effect (Effect Unit)
  , h :: Effect Unit -> Nut -> Effect (Effect Unit)
  }
  -> Effect (Effect Unit)
