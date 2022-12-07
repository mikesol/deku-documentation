module Examples.GroupsOfGroups where

import Prelude

import Assets (alexanderURL)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=))
import Deku.Attributes (klass_)
import Deku.Control (guard, text_)
import Deku.Core (fixed)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useHot)
import Deku.Listeners (click_)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import QualifiedDo.Alt as Alt

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

main :: Effect Unit
main = runInBody Deku.do
  setBadness /\ badness <- useHot Bad
  D.div_
    [ D.div (klass_ "flex justify-between")
        [ D.button
            Alt.do
              klass_ $ buttonClass "indigo"
              click_ $ setBadness Bad
            [ text_ "Bad" ]
        , D.button
            Alt.do
              klass_ $ buttonClass "pink"
              click_ $ setBadness Worse
            [ text_ "Worse" ]
        , D.button
            Alt.do
              klass_ $ buttonClass "green"
              click_ $ setBadness Worst
            [ text_ "Worst" ]
        ]
    , D.div (klass_ "bg-alexander")
        [ D.div (klass_ "p-3")
            [ D.span
                (klass_ "font-aldine text-4xl text-alexander")
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
        , D.div_ [ D.img (D.Src !:= alexanderURL) [] ]
        ]
    ]