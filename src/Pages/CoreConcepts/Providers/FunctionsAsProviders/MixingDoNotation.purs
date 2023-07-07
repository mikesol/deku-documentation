module Pages.CoreConcepts.Providers.FunctionsAsProviders.MixingDoNotation where

import Prelude

import Components.Code (psCode)
import Contracts (Subsection, subsection)
import Deku.Control (text_)
import Deku.DOM as D

mixingDoNotation :: Subsection
mixingDoNotation = subsection
  { title: "Mixing do notation"
  , matter: pure
      [ D.p_
          [ text_ "We've seen at least three variations of "
          , D.code__ "do"
          , text_ " notation in various parts of the documentation."
          ]
      , D.ol_
          [ D.li_ [ D.code__ "Alt.do" ]
          , D.li_ [ D.code__ "Deku.do" ]
          , D.li_
              [ D.span_
                  [ D.code__ "do", text_ " without any special qualifiers" ]
              ]
          ]
      , D.p_
          [ text_ "Each one of these "
          , D.code__ "do"
          , text_
              "s denote a different computational context, so a left-bind in one won't work in another one!"
          ]
      , D.p_
          [ text_ "When working with providers, we introduce another layer of "
          , D.code__ "do"
          , text_ ", which for some may be one "
          , D.code__ "do"
          , text_ " too many. If you're "
          , D.code__ "do"
          , text_ "'d out, the following example:"
          ]
      , psCode
          """do
  myComponent <- component
  Deku.do
    setHook /\ hook <- useState unit
    D.button
      Alt.do
        klass_ "button"
        click $ hook <#> setHook
      [ "hi" ]"""
      , D.p_
          [ text_ "Can be rewritten in "
          , D.code__ "do"
          , text_ "-less form like so:"
          ]
      , psCode
          """component \myComponent ->
  useState unit \(setHook /\ hook) ->
    D.button (klass_ "button" <|> (click $ hook <#> setHook))
      [ "hi" ]"""
      , D.p_ [ text_ "It's up to you what to ", D.code__ "do", text_ "!" ]
      ]
  }
