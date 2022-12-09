module Pages.CoreConcepts.MoreHooks.UseMemoized.InitialEvents where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Alt (alt)
import Data.Array (replicate)
import Data.Foldable (traverse_)
import Data.Int (floor, pow)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attribute (cb, (!:=))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useMemoized')
import Examples as Examples
import QualifiedDo.Alt as Alt
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, valueAsNumber)

inputKls :: String
inputKls =
  """rounded-md
border-gray-300 shadow-sm
border-2 mr-2
border-solid
focus:border-indigo-500 focus:ring-indigo-500
sm:text-sm"""

initialEvents :: forall lock payload. Subsection lock payload
initialEvents = subsection
  { title: "Memoizing without an initial event"
  , matter: pure
      [ D.p_
          [ text_
              "In some cases, it does not make sense to have an initial event, for example if you're building a question-answer app that needs to perform a computation and compute the response. In this case, you can use "
          , D.code__ "useMemoized'"
          , text_
              ". This hook provides the opportunity to map over the internal event, and it is the result of the mapped computation that is memoized."
          ]
      , D.p__
          "In the example below, this method is used to memoize a squaring operation so that the result is computed only once."
      , psCodeWithLink Examples.MemoizedNoEvent
      , exampleBlockquote
          [ Deku.do
              setNumber /\ number <- useMemoized'
                (alt (pure 0) <<< map (_ `pow` 2))
              D.div_
                [ D.div_
                    [ D.input
                        Alt.do
                          klass_ inputKls
                          D.Xtype !:= "number"
                          D.Min !:= "0"
                          D.Max !:= "100"
                          D.Value !:= "0"
                          D.OnChange !:= cb \evt ->
                            traverse_ (valueAsNumber >=> floor >>> setNumber) $
                              (target >=> fromEventTarget) evt
                        []
                    ]
                , D.div_
                    ( replicate 200 $ D.span_
                        [ text (show >>> (_ <> " ") <$> number) ]
                    )
                ]
          ]
      ]
  }
