module Pages.CoreConcepts.MoreHooks.UseRef.TheCaseForRef where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Examples as Examples
import Data.Array (replicate)
import Deku.Attributes (klass_)
import Deku.Control (text)
import Deku.Hooks (useRef, useState, useState')
import Deku.Listeners (click_, slider_)
import QualifiedDo.Alt as Alt

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-pink-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-pink-700 focus:outline-none focus:ring-2
focus:ring-pink-500 focus:ring-offset-2 m-2""" :: String

theCaseForRef :: Subsection
theCaseForRef = subsection
  { title: "What's in a ref?"
  , matter: pure
      [ D.p_
          [ text_ "The "
          , D.code__ "useRef"
          , text_ " hook takes an initial value of type"
          , D.code__ "a"
          , text_ " and an event of type "
          , D.code__ "Event a"
          , text_ " and returns a value of type "
          , D.code__ "Effect a"
          , text_ " that is a reference to the most recent value of the event "
          , D.i__ "or"
          , text_ " the initial value if the event has never fired."
          ]
      , D.p_
          [ text_
              "In the example below, slide the slider from left to right and click on buttons periodically. Each button will update with the most recent value of the slider when it is clicked."
          ]
      , psCodeWithLink Examples.UseRef
      , exampleBlockquote
          [ Deku.do
              let initial = 50.0
              setNum /\ num <- useState initial
              intRef <- useRef initial num
              D.div_
                [ D.input
                    (slider_ setNum)
                    []
                , D.div (klass_ "grid grid-flow-row grid-cols-3")
                    ( replicate 24 Deku.do
                        setButtonText /\ buttonText <- useState "Waiting..."
                        D.button
                          Alt.do
                            klass_ buttonClass
                            click_ $ intRef >>= show >>> setButtonText
                          [ text buttonText ]
                    )
                ]
          ]
      ]
  }
