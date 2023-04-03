module Pages.CoreConcepts.Collections.FixedElements.GroupsOfGroups where

import Prelude

import Assets (alexanderURL)
import Components.Code (psCodeWithLink)
import Contracts (Subsection, subsection)
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
import Examples as Examples
import QualifiedDo.Alt as Alt

-- bg-pink-600
-- hover:bg-pink-700 
-- focus:ring-pink-500
-- bg-magenta-600
-- hover:bg-magenta-700 
-- focus:ring-magenta-500

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

groupsOfGroups :: Subsection
groupsOfGroups = subsection
  { title: "Groups of groups"
  , matter: pure
      [ D.p_
          [ text_ "Because "
          , D.code__ "fixed"
          , text_
              " does not create a DOM element for its content, one may wonder how nested "
          , D.code__ "fixed"
          , text_
              " calls are handled. In Deku, they are always flattened into the lower-most logical parent element. So if there is a fixed in a fixed in a fixed, the inner-most fixed has the same parent as the top-most fixed."
          ]
      , D.p_
          [ text_ "Here's an example of nested "
          , D.code__ "flatten"
          , text_ "s going into the same container element."
          ]
      , psCodeWithLink Examples.GroupsOfGroups
      , D.p__ "And here's the result."
      , Deku.do
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
                    [ D.span (klass_ "font-aldine text-4xl text-alexander")
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
      , D.p_
          [ text_ "In this example, we see the use of "
          , D.code__ "useHot"
          , text_ " instead of "
          , D.code__ "useState"
          , text_
              ". To understand why, think about the contract with the state variable "
          , D.code__ "badness"
          , text_
              ". The UI responds to it by creating a new section and then this section starts listening to "
          , D.code__ "badness"
          , text_ ". But by the time it starts listening to "
          , D.code__ "badness"
          , text_
              ", the click event has already fired, so the inner listener does not evaluate the statement "
          , D.code__ "(_ > Worse)"
          , text_ ". To provide the nested "
          , D.code__ "flatten"
          , text_ " with the most recent event, we use "
          , D.code__ "useHot"
          , text_ "."
          ]
      ]
  }
