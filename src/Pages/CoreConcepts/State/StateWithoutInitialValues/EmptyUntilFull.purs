module Pages.CoreConcepts.State.StateWithoutInitialValues.EmptyUntilFull where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Deku.Listeners (click)
import Effect.Random (random)
import Examples as Examples

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

emptyUntilFull :: Subsection
emptyUntilFull = subsection
  { title: "Empty until full"
  , matter: pure
      [ D.p__
          "Let's revisit the first example from this section, using an uninitialized state."
      , psCodeWithLink Examples.EmptyUntilFull
      , D.p__ "Here's the result."
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useState'
              D.div_
                [ D.button
                    [klass buttonClass,
                      click $ random >>= setNumber]
                    [ text "Update number" ]
                , text $ number <#>
                    show >>> ("Here's a random number: " <> _)
                ]
          ]
      , D.p__
          "The only difference with the initial example is that the text element is rendered to the DOM after the first value has been provided."
      ]
  }
