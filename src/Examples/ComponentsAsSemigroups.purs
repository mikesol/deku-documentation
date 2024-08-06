module Examples.ComponentsAsSemigroups where

import Deku.Toplevel (runInBody)
import Effect (Effect)
import Prelude

import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState)
import Deku.DOM.Listeners as DL
import ExampleAssitant (ExampleSignature)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

app :: ExampleSignature
app runExample = runExample Deku.do
  setAstuce /\ astuce <- useState true
  D.div_
    [ D.div [ DA.klass_ "space-x-2" ]
        [ D.button
            [ DA.klass_ $ buttonClass "indigo"
            , DL.click_ \_ -> setAstuce true
            ]
            [ text_ "Sage" ]
        , D.button
            [ DA.klass_ $ buttonClass "green"
            , DL.click_ \_ -> setAstuce false
            ]
            [ text_ "Pas sage" ]
        ]
    , D.div_
        [ D.div__ "Cher ami,"
            <> D.div__ "Je suis toute émue de vous dire que j'ai"
            <> guard astuce
              (D.div__ "bien compris l'autre jour que vous aviez")
            <> D.div__ "toujours une envie folle de me faire"
            <> guard astuce
              (D.div__ "danser. Je garde le souvenir de votre")
            <> D.div__ "baiser et je voudrais bien que ce soit"
            <> guard astuce
              (D.div__ "une preuve que je puisse être aimée")
            <> D.div__ "par vous. Je suis prête à montrer mon"
            <> guard astuce
              (D.div__ "affection toute désintéressée et sans cal-")
            <> D.div__ "cul, et si vous voulez me voir ainsi"
            <> guard astuce
              (D.div__ "vous dévoiler, sans artifice, mon âme")
            <> D.div__ "toute nue, daignez me faire visite,"
            <> guard astuce
              (D.div__ "nous causerons et en amis franchement")
            <> D.div__ "je vous prouverai que je suis la femme"
            <> guard astuce
              (D.div__ "sincère, capable de vous offrir l'affection")
            <> D.div__ "la plus profonde, comme la plus étroite"
            <> guard astuce
              (D.div__ "amitié, en un mot : la meilleure épouse")
            <> D.div__ "dont vous puissiez rêver. Puisque votre"
            <> guard astuce
              (D.div__ "âme est libre, pensez que l'abandon ou je")
            <> D.div__ "vis est bien long, bien dur et souvent bien"
            <> guard astuce
              (D.div__ "insupportable. Mon chagrin est trop")
            <> D.div__ "gros. Accourrez bien vite et venez me le"
            <> guard astuce
              (D.div__ "faire oublier. À vous je veux me sou-")
            <> D.div__ "mettre entièrement."
            <> D.div__ "Votre poupée"
        ]
    ]

main :: Effect Unit
main = void $ app runInBody