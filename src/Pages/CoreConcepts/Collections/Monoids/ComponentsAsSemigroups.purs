module Pages.CoreConcepts.Collections.Monoids.ComponentsAsSemigroups where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click_)
import Examples as Examples
import QualifiedDo.Alt as Alt

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

componentsAsSemigroups :: forall lock payload. Subsection lock payload
componentsAsSemigroups = subsection
  { title: "Components as semigroups"
  , matter: pure
      [ D.p_
          [ text_
              "Components can be appended together, and the result will be a component. This is the same as enclosing all of the components in a "
          , D.code__ "fixed"
          , text_
              " bloc. Let's see this in action with George Sand's famous letter to Alfred de Musset."
          ]
      , psCodeWithLink Examples.ComponentsAsSemigroups
      , Deku.do
          setAstuce /\ astuce <- useState true
          exampleBlockquote
            [ D.div (klass_ "space-x-2")
                [ D.button
                    Alt.do
                      klass_ $ buttonClass "indigo"
                      click_ $ setAstuce true
                    [ text_ "Sage" ]
                , D.button
                    Alt.do
                      klass_ $ buttonClass "green"
                      click_ $ setAstuce false
                    [ text_ "Pas sage" ]
                ]
            , D.div_
                [ D.p__ "Cher ami,"
                    <> D.p__ "Je suis toute ??mue de vous dire que j'ai"
                    <> guard astuce
                      (D.p__ "bien compris l'autre jour que vous aviez")
                    <> D.p__ "toujours une envie folle de me faire"
                    <> guard astuce
                      (D.p__ "danser. Je garde le souvenir de votre")
                    <> D.p__ "baiser et je voudrais bien que ce soit"
                    <> guard astuce
                      (D.p__ "une preuve que je puisse ??tre aim??e")
                    <> D.p__ "par vous. Je suis pr??te ?? montrer mon"
                    <> guard astuce
                      (D.p__ "affection toute d??sint??ress??e et sans cal-")
                    <> D.p__ "cul, et si vous voulez me voir ainsi"
                    <> guard astuce
                      (D.p__ "vous d??voiler, sans artifice, mon ??me")
                    <> D.p__ "toute nue, daignez me faire visite,"
                    <> guard astuce
                      (D.p__ "nous causerons et en amis franchement")
                    <> D.p__ "je vous prouverai que je suis la femme"
                    <> guard astuce
                      (D.p__ "sinc??re, capable de vous offrir l'affection")
                    <> D.p__ "la plus profonde, comme la plus ??troite"
                    <> guard astuce
                      (D.p__ "amiti??, en un mot : la meilleure ??pouse")
                    <> D.p__ "dont vous puissiez r??ver. Puisque votre"
                    <> guard astuce
                      (D.p__ "??me est libre, pensez que l'abandon ou je")
                    <> D.p__ "vis est bien long, bien dur et souvent bien"
                    <> guard astuce
                      (D.p__ "insupportable. Mon chagrin est trop")
                    <> D.p__ "gros. Accourrez bien vite et venez me le"
                    <> guard astuce
                      (D.p__ "faire oublier. ?? vous je veux me sou-")
                    <> D.p__ "mettre enti??rement."
                    <> D.p__ "Votre poup??e"
                ]
            ]
      ]
  }
