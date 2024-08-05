module Examples.GroupsOfGroups where

import Prelude

import Assets (alexanderBackgroundURL, alexanderURL)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.Listeners as DL
import Deku.Do as Deku
import Deku.Hooks (guard, useState)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import ExampleAssitant (ExampleSignature)

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """mb-3 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

data AlexandersDay = Bad | Worse | Worst

derive instance Eq AlexandersDay
derive instance Ord AlexandersDay

app :: ExampleSignature
app runExample = runExample Deku.do
  setBadness /\ badness <- useState Bad
  D.div_
    [ D.div [ DA.klass_ "flex justify-between" ]
        [ D.button
            [ DA.klass_ $ buttonClass "indigo"
            , DL.click_ \_ -> setBadness Bad
            ]
            [ text_ "Bad" ]
        , D.button
            [ DA.klass_ $ buttonClass "pink"
            , DL.click_ \_ -> setBadness Worse
            ]
            [ text_ "Worse" ]
        , D.button
            [ DA.klass_ $ buttonClass "green"
            , DL.click_ \_ -> setBadness Worst
            ]
            [ text_ "Worst" ]
        ]
    , D.div
        [ DA.style_ $ "background-image: url('" <> alexanderBackgroundURL <>
            "');"
        ]
        [ D.div [ DA.klass_ "p-3" ]
            [ D.span
                [ DA.klass_ "font-aldine text-4xl text-alexander" ]
                [ text_
                    "Alexander and the Terrible, Horrible,"
                , guard (badness <#> (_ > Bad)) $ fixed
                    [ text_ " Dreadful,"
                    , guard (badness <#> (_ > Worse)) $ fixed
                        [ text_ " Hideous,"
                        , text_ " Soul-crushing,"
                        ]
                    , text_ " Ruinous,"
                    ]
                , text_ " No Good,"
                , text_ " Very Bad Day"
                ]
            ]
        , D.div_
            [ D.img
                [ DA.ariaLabel_
                    "Cover of Alexander and the Terrible, Horrible, No Good, Very Bad Day"
                , DA.src_ alexanderURL
                ]
                []
            ]
        ]
    ]

main :: Effect Unit
main = void $ app runInBody