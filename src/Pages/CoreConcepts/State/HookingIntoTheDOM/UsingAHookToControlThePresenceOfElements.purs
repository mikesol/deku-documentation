module Pages.CoreConcepts.State.HookingIntoTheDOM.UsingAHookToControlThePresenceOfElements where

import Prelude

import Components.Code (psCode)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.Tuple.Nested ((/\))
import Deku.Attributes (klass_)
import Deku.Control (guard, text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import QualifiedDo.Alt as Alt

usingAHookToControlThePresenceOfElements
  :: forall lock payload. Subsection lock payload
usingAHookToControlThePresenceOfElements = subsection
  { title: "Using a hook to control presence"
  , matter: pure
      [ D.p_
          [ text_
              "You can also use a boolean hook to control the presence or absence of an object via the "
          , D.code__ "guard"
          , text_ " function."
          ]
      , psCode
          """module Main where

import Prelude

import Data.Tuple.Nested ((/\))
import Deku.Control (guard, text, text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Attributes (klass_)
import Deku.Listeners (click)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import QualifiedDo.Alt as Alt

main :: Effect Unit
main = runInBody Deku.do
  setPresence /\ presence <- useState true
  D.div_
    [ guard presence (text_ "Now you see me, ")
    , D.a
        Alt.do
          klass_ "cursor-pointer"
          click $ presence <#> not >>> setPresence
        [ text $ presence <#>
            if _ then "now you don't." else "Oops, come back!"
        ]
    ]"""
      , exampleBlockquote
          [ Deku.do
              setPresence /\ presence <- useState true
              D.div_
                [ guard presence (text_ "Now you see me, ")
                , D.a
                    Alt.do
                      klass_ "cursor-pointer"
                      click $ presence <#> not >>> setPresence
                    [ text $ presence <#>
                        if _ then "now you don't." else "Oops, come back!"
                    ]
                ]
          ]
      , D.p_
          [ text_
              "In case you ever want to typeset an empty element (meaning an element that does not appear in the DOM at all), you can use "
          , D.code__ "blank"
          , text_ ". In fact, the definition of "
          , D.code__ "guard"
          , text_ " above is just the following."
          ]
      , psCode """guard eb d = eb <#~> if _ then d else blank"""
      ]
  }
