module Examples.ComponentsAsSemigroups where

import Prelude

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState)
import Deku.Listeners (click)
import ExampleAssitant (ExampleSignature)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

main :: ExampleSignature
main runExample = runExample Deku.do
  setAstuce /\ astuce <- useState true
  D.div_
    [ D.div [ klass "space-x-2" ]
        [ D.button
            [ klass $ buttonClass "indigo"
            , click $ setAstuce true
            ]
            [ text "Sage" ]
        , D.button
            [ klass $ buttonClass "green"
            , click $ setAstuce false
            ]
            [ text "Pas sage" ]
        ]
    , D.div_
        [ D.p__ "Cher ami,"
            <> D.p__ "Je suis toute émue de vous dire que j'ai"
            <> guard astuce
              (D.p__ "bien compris l'autre jour que vous aviez")
            <> D.p__ "toujours une envie folle de me faire"
            <> guard astuce
              (D.p__ "danser. Je garde le souvenir de votre")
            <> D.p__ "baiser et je voudrais bien que ce soit"
            <> guard astuce
              (D.p__ "une preuve que je puisse être aimée")
            <> D.p__ "par vous. Je suis prête à montrer mon"
            <> guard astuce
              (D.p__ "affection toute désintéressée et sans cal-")
            <> D.p__ "cul, et si vous voulez me voir ainsi"
            <> guard astuce
              (D.p__ "vous dévoiler, sans artifice, mon âme")
            <> D.p__ "toute nue, daignez me faire visite,"
            <> guard astuce
              (D.p__ "nous causerons et en amis franchement")
            <> D.p__ "je vous prouverai que je suis la femme"
            <> guard astuce
              (D.p__ "sincère, capable de vous offrir l'affection")
            <> D.p__ "la plus profonde, comme la plus étroite"
            <> guard astuce
              (D.p__ "amitié, en un mot : la meilleure épouse")
            <> D.p__ "dont vous puissiez rêver. Puisque votre"
            <> guard astuce
              (D.p__ "âme est libre, pensez que l'abandon ou je")
            <> D.p__ "vis est bien long, bien dur et souvent bien"
            <> guard astuce
              (D.p__ "insupportable. Mon chagrin est trop")
            <> D.p__ "gros. Accourrez bien vite et venez me le"
            <> guard astuce
              (D.p__ "faire oublier. À vous je veux me sou-")
            <> D.p__ "mettre entièrement."
            <> D.p__ "Votre poupée"
        ]
    ]