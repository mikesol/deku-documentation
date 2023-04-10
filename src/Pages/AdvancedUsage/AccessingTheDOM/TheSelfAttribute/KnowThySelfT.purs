module Pages.AdvancedUsage.AccessingTheDOM.TheSelfAttribute.KnowThySelfT where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState')
import Examples as Examples
import Web.HTML.HTMLInputElement (value)

inputKls :: String
inputKls =
  """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""

knowThySelfT :: Subsection
knowThySelfT = subsection
  { title: "Know thy SelfT"
  , matter: pure
      [ D.p_
          [ text_ "Certain elements, like "
          , D.code__ "input"
          , text_ " and "
          , D.code__ "button"
          , text_ " classes, have a strongly-typed variant of "
          , D.code__ "Self"
          , text_ " called "
          , D.code__ "SelfT"
          , text_
              " that makes it a bit easier to work with the element using PureScript's DOM APIs."
          ]
      , psCodeWithLink Examples.KnowThySelfT
      , exampleBlockquote
          [ Deku.do
              setTxt /\ txt <- useState'
              setInput /\ input <- useState'
              D.div_
                [ D.input
                      [klass_ inputKls,
                      input <#> \i -> D.OnInput := (value i >>= setTxt),
                      D.SelfT !:= setInput]
                    []
                , D.div_ [ text txt ]
                ]

          ]
      ]
  }
