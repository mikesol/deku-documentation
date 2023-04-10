module Examples.BooleanLogicOnEvents where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

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

main :: Effect Unit
main = runInBody Deku.do
  setP /\ p <- useState true
  setQ /\ q <- useState true
  let
    tdTableClass = klass_ tableClass
    button setter letter value = D.button
      [ klass_ buttonClass, click_ (setter value) ]
      [ text_ (letter <> " = " <> show value) ]
  D.div_
    [ D.div_ $
        [ button setP "P" true
        , button setP "P" false
        , button setQ "Q" true
        , button setQ "Q" false
        ]
    , D.table [ klass_ tableClass ]
        [ D.tr_
            [ D.th [ klass_ tableClass ] [ text_ "Equation" ]
            , D.th [ klass_ tableClass ] [ text_ "Result" ]
            ]
        , D.tr_
            [ D.td [ tdTableClass ]
                [ text_ (show (rule1 (Var "P") (Var "Q"))) ]
            , D.td [ tdTableClass ] [ text (show <$> rule1 p q) ]
            ]
        , D.tr_
            [ D.td [ tdTableClass ]
                [ text_ (show (rule2 (Var "P") (Var "Q"))) ]
            , D.td [ tdTableClass ] [ text (show <$> rule2 p q) ]
            ]
        , D.tr_
            [ D.td [ tdTableClass ]
                [ text_ (show (rule3 (Var "P") (Var "Q"))) ]
            , D.td [ tdTableClass ] [ text (show <$> rule3 p q) ]
            ]
        , D.tr_
            [ D.td [ tdTableClass ]
                [ text_ (show (rule4 (Var "P") (Var "Q"))) ]
            , D.td [ tdTableClass ] [ text (show <$> rule4 p q) ]
            ]
        , D.tr_
            [ D.td [ tdTableClass ]
                [ text_ (show (rule5 (Var "P"))) ]
            , D.td [ tdTableClass ] [ text (show <$> rule5 p) ]
            ]
        , D.tr_
            [ D.td [ tdTableClass ]
                [ text_ (show (rule6 (Var "P"))) ]
            , D.td [ tdTableClass ] [ text (show <$> rule6 p) ]
            ]
        , D.tr_
            [ D.td [ tdTableClass ]
                [ text_ (show (rule5 (Var "Q"))) ]
            , D.td [ tdTableClass ] [ text (show <$> rule5 q) ]
            ]
        , D.tr_
            [ D.td [ tdTableClass ]
                [ text_ (show (rule6 (Var "Q"))) ]
            , D.td [ tdTableClass ] [ text (show <$> rule6 q) ]
            ]
        ]
    ]