module Pages.CoreConcepts.Components.AddingEventHandlers.ShorthandListeners where

import Prelude

import Components.Table (tableClass)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text_)
import Deku.DOM as D
import Examples as Examples

shorthandListeners :: Subsection
shorthandListeners = subsection
  { title: "Shorthand event listeners"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.ShorthandListeners
      pure
        [ D.p_
            [ text_
                "Similar to attributes, some event listeners also have shorthand versions in Deku."
            ]
        , D.table [ tableClass ]
            [ D.tr_
                [ D.th [ tableClass ] [ text_ "Shorthand" ]
                , D.th [ tableClass ] [ text_ "Longer version" ]
                ]
            , D.tr_
                [ D.td [ tableClass ]
                    [ D.code_ [ text_ "DL.runOn DL.click $ log \"foo\"" ] ]
                , D.td [ tableClass ]
                    [ D.code_ [ text_ "D.OnClick := log \"foo\"" ] ]
                ]
            , D.tr_
                [ D.td [ tableClass ]
                    [ D.code_ [ text_ "slider logShow" ] ]
                , D.td [ tableClass ]
                    [ D.code_
                        [ text_
                            """[DA.xtypeRange, D.OnInput :=
    cb \e ->
      for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> logShow)]"""
                        ]
                    ]
                ]
            , D.tr_
                [ D.td [ tableClass ]
                    [ D.code_ [ text_ "textInput_ logShow" ] ]
                , D.td [ tableClass ]
                    [ D.code_
                        [ text_
                            """D.OnInput :=
  cb \e ->
    for_
      (target e >>= fromEventTarget)
      (value >=> logShow)"""
                        ]
                    ]
                ]
            ]
        , D.p__
            "As an example, consider the following slider. If you open your Developer Console and move the slider below, you'll see it light up with numbers!"
        , example
        , D.p__
            "While these events are fun, the true power of Deku lies in its ability to use events to change aspects of the DOM. The next section explores how that is done."
        ]
  }
