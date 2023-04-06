module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelf where

import Prelude

import Components.Code (psCodeWithLink)
import Components.Disclaimer (disclaimer)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.String.Utils (words)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Effect.Aff (Milliseconds(..), delay, launchAff_)
import Effect.Class (liftEffect)
import Examples as Examples
import Web.DOM.Element (toParentNode)
import Web.DOM.HTMLCollection as HTMLCollection
import Web.DOM.ParentNode (children)

knowThySelf :: Subsection
knowThySelf = subsection
  { title: "Know thy Self"
  , matter: pure
      [ D.p_
          [ text_ "An event hooked up to the special "
          , D.code__ "Self"
          , text_
              " attribute will invoke an effectful function with the DOM element as its argument whenever the event fires. Note that the event fires "
          , D.i__ "before"
          , text_
              " an element's attributes and children are added, so make sure to defer your computation until the next browser tick if you want these things to be present, like in the example below."
          ]
      , psCodeWithLink Examples.KnowThySelf
      , exampleBlockquote
          [ Deku.do
              setLength /\ length <- useState'
              D.div
                Alt.do
                  D.Self !:= \e -> launchAff_ do
                    delay (Milliseconds 0.0)
                    liftEffect do
                      kids <- children (toParentNode e)
                      HTMLCollection.length kids >>= setLength
                ( (words "I have this many kids:" <#> D.div__) <>
                    [ D.div_ [ text (show <$> length) ] ]
                )

          ]
      , disclaimer
          { header: text_ "Who would've thunk?"
          , message: D.div_
              [ text_ "Because it is not a listener, the "
              , D.code__ "Self"
              , text_
                  " attribute thunks its effect immediately when an event occurs. So make sure to manage your events carefully and/or to make sure your effectful shenanigans with your"
              , D.code__ "Self"
              , text_ " are idempotent."
              ]
          }
      ]
  }
