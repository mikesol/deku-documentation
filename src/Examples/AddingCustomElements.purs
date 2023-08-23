module Examples.AddingCustomElements where

import Prelude

import Data.Maybe (Maybe(..))
import Deku.Attribute (Attribute, prop', unsafeAttribute)
import Deku.Control (elementify2, text_)
import Deku.Core (Nut)
import Deku.DOM (HTMLAnchorElement)
import Deku.Toplevel (runInBody')
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
myNiftyAnchor = elementify2 Nothing "a"

data MyPages = JoyrideFM | MikeSolomonOrg
data MyTarget = Blank

myNiftyHref
  :: forall r
   . Poll MyPages
  -> Poll (Attribute (href :: MyPages | r))
myNiftyHref = map
  ( unsafeAttribute <<< { key: "class", value: _ } <<< prop' <<< case _ of
      JoyrideFM -> "https://joyride.fm"
      MikeSolomonOrg -> "https://mikesolomon.org"
  )

myNiftyTarget
  :: forall r
   . Poll MyTarget
  -> Poll (Attribute (target :: MyTarget | r))
myNiftyTarget = map
  ( unsafeAttribute <<< { key: "class", value: _ } <<< prop' <<< const "_blank"
  )

app :: ExampleSignature
app runExample = runExample.t do
  myNiftyAnchor
    [ myNiftyHref $ pure JoyrideFM
    , myNiftyTarget $ pure Blank
    ]
    [ text_ "hi" ]

main :: Effect Unit
main = void $ app { t: map (map void) runInBody' }