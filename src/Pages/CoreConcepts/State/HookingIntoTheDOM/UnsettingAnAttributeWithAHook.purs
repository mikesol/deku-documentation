module Pages.CoreConcepts.State.HookingIntoTheDOM.UnsettingAnAttributeWithAHook where

import Prelude

import Components.Code (psCodeWithLink)
import Components.ExampleBlockquote (exampleBlockquote)
import Contracts (Subsection, subsection)
import Data.String (Pattern(..), Replacement(..), replaceAll)
import Data.Tuple.Nested ((/\))
import Deku.Attribute ((!:=), (:=))
import Deku.Attributes (klass_)
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Do as Deku
import Deku.Hooks (useState)
import Deku.Listeners (click)
import Examples as Examples

-- bg-pink-600
-- hover:bg-pink-700 
-- focus:ring-pink-500
-- bg-magenta-600
-- hover:bg-magenta-700 
-- focus:ring-magenta-500

buttonClass :: String -> String
buttonClass color =
  replaceAll (Pattern "COLOR") (Replacement color)
    """ml-4 inline-flex items-center rounded-md
border border-transparent bg-COLOR-600 px-3 py-2
text-sm font-medium leading-4 text-white shadow-sm
hover:bg-COLOR-700 focus:outline-none focus:ring-2
focus:ring-COLOR-500 focus:ring-offset-2"""

unsettingAnAttributeWithAHook :: Subsection
unsettingAnAttributeWithAHook = subsection
  { title: "Unsetting an attribute with a hook"
  , matter: pure
      [ D.p_
          [ text_
              "Sometimes, you need to unset an attribute. You can do that by setting the attribute to "
          , D.code__ "unit"
          , text_ " via your hook."
          ]
      , psCodeWithLink Examples.UnsettingAttributes
      , exampleBlockquote
          [ Deku.do
              setStyleSwitch /\ styleSwitch <- useState false
              D.div_
                [ D.a
                      [D.Target !:= "_blank",
                      styleSwitch <#>
                        if _ then D.Style := "color:magenta;"
                        else D.Style := unit]
                    [ text_ "Click me" ]
                , D.button
                      [klass_ $ buttonClass "pink",
                      click $ styleSwitch <#> not >>> setStyleSwitch]
                    [ text_ "Switch style" ]
                ]
          ]
      , D.p_
          [ text_
              "Under the hood, unsetting an attribute calls the DOM's "
          , D.code__
              "removeAttribute"
          , text_
              " function, so it'll be as if the attribute were never there. What attribute? Exactly..."
          ]
      ]
  }
