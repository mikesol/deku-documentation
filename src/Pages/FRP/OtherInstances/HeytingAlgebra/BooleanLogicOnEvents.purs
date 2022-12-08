module Pages.FRP.OtherInstances.HeytingAlgebra.BooleanLogicOnEvents where

import Prelude

import Components.Code (psCodeNoCollapseWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Control.Alt ((<|>))
import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Examples as Examples

data FreeHeytingAlgebra
  = FF
  | TT
  | If FreeHeytingAlgebra FreeHeytingAlgebra
  | And FreeHeytingAlgebra FreeHeytingAlgebra
  | Or FreeHeytingAlgebra FreeHeytingAlgebra
  | Not FreeHeytingAlgebra
  | Var String

derive instance Generic FreeHeytingAlgebra _

instance Show FreeHeytingAlgebra where
  show s = genericShow s

instance HeytingAlgebra FreeHeytingAlgebra where
  ff = FF
  tt = FF
  implies = If
  conj = And
  disj = Or
  not = Not

rule1 :: forall a. HeytingAlgebra a => a -> a -> a
rule1 p q = not (p || q)

rule2 :: forall a. HeytingAlgebra a => a -> a -> a
rule2 p q = not p && not q

rule3 :: forall a. HeytingAlgebra a => a -> a -> a
rule3 p q = not (p && q)

rule4 :: forall a. HeytingAlgebra a => a -> a -> a
rule4 p q = not p || not q

rule5 :: forall a. HeytingAlgebra a => a -> a
rule5 p = not (not p)

rule6 :: forall a. HeytingAlgebra a => a -> a
rule6 p = p

buttonClass =
  """inline-flex items-center rounded-md
border border-transparent bg-indigo-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-indigo-700 focus:outline-none focus:ring-2
focus:ring-indigo-500 focus:ring-offset-2 mr-6""" :: String

tableClass :: String
tableClass =
  """pl-2 pr-2 border
border-slate-500 dark:border-white-300"""

booleanLogicOnEvents :: forall lock payload. Subsection lock payload
booleanLogicOnEvents = subsection
  { title: "Boolean logic on events"
  , matter: pure
      [ D.p_
          [ text_
              "In the example below, we use the same functions to perform boolean logic on the events in the table as on the labels. Granted, this is highly overengineered, but it's sorta cool that it works!"
          ]
      , psCodeNoCollapseWithLink Examples.BooleanLogicOnEvents
      , exampleBlockquote
          [ Deku.do
              setP /\ p <- useState true
              setQ /\ q <- useState true
              D.div_
                [ D.div_ $
                    [ setP /\ "P" /\ true
                    , setP /\ "P" /\ false
                    , setQ /\ "Q" /\ true
                    , setQ /\ "Q" /\ false
                    ] <#> \(f /\ n /\ k) -> D.button
                      (klass_ buttonClass <|> click_ (f k))
                      [ text_ (n <> " = " <> show k) ]
                , D.table (klass_ tableClass)
                    [ D.tr_
                        [ D.th (klass_ tableClass) [ text_ "Equation" ]
                        , D.th (klass_ tableClass) [ text_ "Result" ]
                        ]
                    , D.tr_
                        [ D.td (klass_ tableClass)
                            [ text_ (show (rule1 (Var "P") (Var "Q"))) ]
                        , D.td (klass_ tableClass) [ text (show <$> rule1 p q) ]
                        ]
                    , D.tr_
                        [ D.td (klass_ tableClass)
                            [ text_ (show (rule2 (Var "P") (Var "Q"))) ]
                        , D.td (klass_ tableClass) [ text (show <$> rule2 p q) ]
                        ]
                    , D.tr_
                        [ D.td (klass_ tableClass)
                            [ text_ (show (rule3 (Var "P") (Var "Q"))) ]
                        , D.td (klass_ tableClass) [ text (show <$> rule3 p q) ]
                        ]
                    , D.tr_
                        [ D.td (klass_ tableClass)
                            [ text_ (show (rule4 (Var "P") (Var "Q"))) ]
                        , D.td (klass_ tableClass) [ text (show <$> rule4 p q) ]
                        ]
                    , D.tr_
                        [ D.td (klass_ tableClass)
                            [ text_ (show (rule5 (Var "P"))) ]
                        , D.td (klass_ tableClass) [ text (show <$> rule5 p) ]
                        ]
                    , D.tr_
                        [ D.td (klass_ tableClass)
                            [ text_ (show (rule6 (Var "P"))) ]
                        , D.td (klass_ tableClass) [ text (show <$> rule6 p) ]
                        ]
                    , D.tr_
                        [ D.td (klass_ tableClass)
                            [ text_ (show (rule5 (Var "Q"))) ]
                        , D.td (klass_ tableClass) [ text (show <$> rule5 q) ]
                        ]
                    , D.tr_
                        [ D.td (klass_ tableClass)
                            [ text_ (show (rule6 (Var "Q"))) ]
                        , D.td (klass_ tableClass) [ text (show <$> rule6 q) ]
                        ]
                    ]
                ]
          ]
      ]
  }
