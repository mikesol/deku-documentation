module Examples.AddingCustomElements where

import Prelude

import Data.Maybe (Maybe(..))
import Deku.Attribute (Attribute)
import Deku.Control (elementify, text_)
import Deku.Core (Nut, attributeAtYourOwnRisk)
import Deku.DOM (HTMLAnchorElement)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)
import FRP.Poll (Poll)
import Type.Proxy (Proxy)

type HTMLMyNiftyAnchor (r :: Row Type) =
  ( __tag :: Proxy "HTMLMyNiftyAnchor"
  , href :: MyPages
  , target :: MyTarget
  | HTMLAnchorElement r
  )

myNiftyAnchor
  :: Array (Poll (Attribute (HTMLMyNiftyAnchor ()))) -> Array Nut -> Nut
myNiftyAnchor = elementify Nothing "a"

data MyPages = PureScript | MikeSolomonOrg
data MyTarget = Blank

myNiftyHref
  :: forall r
   . Poll MyPages
  -> Poll (Attribute (href :: MyPages | r))
myNiftyHref = map
  ( attributeAtYourOwnRisk "class" <<< case _ of
      PureScript -> "https://purescript.org"
      MikeSolomonOrg -> "https://mikesolomon.org"
  )

myNiftyTarget
  :: forall r
   . Poll MyTarget
  -> Poll (Attribute (target :: MyTarget | r))
myNiftyTarget = map
  ( attributeAtYourOwnRisk "target" <<< const "_blank"
  )

app :: ExampleSignature
app runExample = runExample do
  myNiftyAnchor
    [ myNiftyHref $ pure PureScript
    , myNiftyTarget $ pure Blank
    ]
    [ text_ "hi" ]

main :: Effect Unit
main = void $ app $ map pure runInBody