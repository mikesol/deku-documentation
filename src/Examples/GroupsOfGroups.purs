module Examples.GroupsOfGroups where

import Prelude
import ExampleAssitant (ExampleSignature)

import Assets (alexanderURL)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((:=))
import Deku.Attributes (klass)
import Deku.Control (text)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (guard, useState)
import Deku.Listeners (click)

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

main :: ExampleSignature
main runExample = runExample Deku.do
  setBadness /\ badness <- useState Bad
  D.div_
    [ D.div [ klass "flex justify-between" ]
        [ D.button
            [ klass $ buttonClass "indigo"
            , click $ setBadness Bad
            ]
            [ text "Bad" ]
        , D.button
            [ klass $ buttonClass "pink"
            , click $ setBadness Worse
            ]
            [ text "Worse" ]
        , D.button
            [ klass $ buttonClass "green"
            , click $ setBadness Worst
            ]
            [ text "Worst" ]
        ]
    , D.div [ klass "bg-alexander" ]
        [ D.div [ klass "p-3" ]
            [ D.span
                [ klass "font-aldine text-4xl text-alexander" ]
                [ text
                    "Alexander and the Terrible, Horrible,"
                , guard (badness <#> (_ > Bad)) $ fixed
                    [ text " Dreadful,"
                    , guard (badness <#> (_ > Worse)) $ fixed
                        [ text " Hideous,"
                        , text " Soul-crushing,"
                        ]
                    , text " Ruinous,"
                    ]
                , text " No Good,"
                , text " Very Bad Day"
                ]
            ]
        , D.div_ [ D.img [ D.Src := alexanderURL ] [] ]
        ]
    ]