module Examples.KnowThySelf where

import Deku.Toplevel (runInBody')
import Effect (Effect)
import Prelude
import ExampleAssitant (ExampleSignature)

import Data.String.Utils (words)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=), (<:=>), (!:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')

import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class (liftEffect)
import Web.DOM.Element (toParentNode)
import Web.DOM.HTMLCollection as HTMLCollection
import Web.DOM.ParentNode (children)

app :: ExampleSignature
app runExample = runExample Deku.do
  setLength /\ length <- useState'
  D.div
    [ D.Self := \e -> launchAff_ do
        delay (Milliseconds 0.0)
        liftEffect do
          kids <- children (toParentNode e)
          HTMLCollection.length kids >>= setLength
    ]
    ( (words "I have this many kids:" <#> D.div__) <>
        [ D.div_ [ text (show <$> length) ] ]
    )

main :: Effect Unit
main = void $ app (map (map void) runInBody')