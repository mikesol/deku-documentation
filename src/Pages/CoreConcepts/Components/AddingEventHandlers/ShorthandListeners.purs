module Pages.CoreConcepts.Components.AddingEventHandlers.ShorthandListeners where

import Prelude

import Components.Table (tableClass)
import Components.TargetedLink (targetedLink)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

shorthandListeners :: Subsection
shorthandListeners = subsection
  { title: "Combinators, enums, and a third thing - oh my!"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.ShorthandListeners
      pure
        [ D.p_
            [ text_
                "Often times, you won't want to use the full power of a listener but rather a shorthand version. For example, you may not care about the incoming event, or you may only want to grab a "
            , D.code__ "Number"
            , text_
                " from said event. In these cases, Deku boasts a small and mighty library of listener cominators."
            ]
        , D.table [ tableClass ]
            [ D.tr_
                [ D.th [ tableClass ] [ text_ "Combinator" ]
                , D.th [ tableClass ] [ text_ "Meaning" ]
                ]
            , D.tr_
                [ D.td [ tableClass ]
                    [ D.code__ "DL.runOn" ]
                , D.td [ tableClass ]
                    [ text_ "Use this listener with a simple effect" ]
                ]
            , D.tr_
                [ D.td [ tableClass ]
                    [ D.code_ [ text_ "DL.numberOn" ] ]
                , D.td [ tableClass ]
                    [ text_
                        "Grab a number from this listener, and if there's no number, do nothing."
                    ]
                ]
            , D.tr_
                [ D.td [ tableClass ]
                    [ D.code__ "DL.checkedOn" ]
                , D.td [ tableClass ]
                    [ text_
                        "Grab a boolean from this listener, and if there's no boolean, do nothing."
                    ]
                ]
            ]
        , D.p_
            [ text_
                "In addition, there are also some attributes that act more like enums. This is especially true for the "
            , D.code__ "type"
            , text_ " attribute of the "
            , D.code__ "input"
            , text_ " element."
            ]
        , D.table [ tableClass ]
            [ D.tr_
                [ D.th [ tableClass ] [ text_ "Attribute" ]
                , D.th [ tableClass ] [ text_ "Meaning" ]
                ]
            , D.tr_
                [ D.td [ tableClass ]
                    [ D.code__ "DA.xtypeRange" ]
                , D.td [ tableClass ]
                    [ D.p_
                        [ text_ "Make an "
                        , D.code__ "input"
                        , text_ "'s type "
                        , D.code__ "range"
                        , text_ "."
                        ]
                    ]
                ]
            , D.tr_
                [ D.td [ tableClass ]
                    [ D.code__ "DA.xtypeButton" ]
                , D.td [ tableClass ]
                    [ D.p_
                        [ text_ "Make an "
                        , D.code__ "input"
                        , text_ "'s type "
                        , D.code__ "button"
                        , text_ "."
                        ]
                    ]
                ]
            ]
        , D.p_
            [ text_ "The table above goes on for all valid "
            , targetedLink
                "https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input"
                [ text_ "input types" ]
            , text_ "."
            ]
        , D.p_
            [ text_
                "I know this section heading promised a third thing, but there is no third thing. It feels like there should be, though, right? Like in "
            , targetedLink "https://www.youtube.com/watch?v=osVwx5qGvvQ"
                [ text_ "this monologue" ]
            , text_ "."
            ]
        , D.p_
            [ text_
                " As an example, consider the following slider. If you open your Developer Console and move the slider below, you’ll see it light up with numbers!"
            ]
        , example
        , D.p__
            "While these events are fun, the true power of Deku lies in its ability to use events to change aspects of the DOM. The next section explores how that is done."
        ]
  }
