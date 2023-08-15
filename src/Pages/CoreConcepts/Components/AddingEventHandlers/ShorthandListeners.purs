module Pages.CoreConcepts.Components.AddingEventHandlers.ShorthandListeners where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Components.Table (tableClass)
import Contracts (Subsection, subsection)
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (slider)
import Effect.Class.Console (logShow)
import Examples as Examples

shorthandListeners :: Subsection
shorthandListeners = subsection
  { title: "Shorthand event listeners"
  , matter: pure
      [ D.p_
          [ text_
              "Similar to attributes, some event listeners also have shorthand versions in Deku."
          ]
      , D.table [tableClass]
          [ D.tr_
              [ D.th [tableClass] [ text_ "Shorthand" ]
              , D.th [tableClass] [ text_ "Longer version" ]
              ]
          , D.tr_
              [ D.td [tableClass] [ D.code_ [ text_ "click $ log \"foo\"" ] ]
              , D.td [tableClass]
                  [ D.code_ [ text_ "D.OnClick := log \"foo\"" ] ]
              ]
          , D.tr_
              [ D.td [tableClass] [ D.code_ [ text_ "slider logShow" ] ]
              , D.td [tableClass]
                  [ D.code_
                      [ text
                          """[D.Xtype !:= "range", D.OnInput :=
    cb \e ->
      for_
        (target e >>= fromEventTarget)
        (valueAsNumber >=> logShow)]"""
                      ]
                  ]
              ]
          , D.tr_
              [ D.td [tableClass] [ D.code_ [ text_ "textInput_ logShow" ] ]
              , D.td [tableClass]
                  [ D.code_
                      [ text
                          """D.OnInput :=
  cb \e ->
    for_
      (target e >>= fromEventTarget)
      (value >=> logShow)"""
                      ]
                  ]
              ]
          ]
      , D.p__ "As an example, consider the following slider."
      , psCodeWithLink Examples.ShorthandListeners
      , D.p__
          "If you open your Developer Console and move the slider below, you'll see it light up with numbers!"
      , exampleBlockquote
          [ D.input (slider logShow) [] ]
      , D.p__
          "While these events are fun, the true power of Deku lies in its ability to use events to change aspects of the DOM. The next section explores how that is done."
      ]
  }
