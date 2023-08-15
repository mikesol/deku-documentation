module Pages.CoreConcepts.State.HookingIntoTheDOM.UsingAHookToControlThePresenceOfElements where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text, text_)
import Deku.DOM as D
import Examples as Examples

usingAHookToControlThePresenceOfElements
  :: Subsection
usingAHookToControlThePresenceOfElements = subsection
  { title: "Using a hook to control presence"
  , matter: do
      example <- getExample StartCollapsed Nothing
        Examples.UsingAHookToControlPresence
      pure
        [ D.p_
            [ text
                "You can also use a boolean hook to control the presence or absence of an object via the "
            , D.code__ "guard"
            , text_ " function."
            ]
        , example
        , D.p_
            [ text
                "In case you ever want to typeset an empty element (meaning an element that does not appear in the DOM at all), you can use "
            , D.code__ "blank"
            , text_ ". In fact, the definition of "
            , D.code__ "guard"
            , text_ " above is just the following."
            ]
        , psCode """guard eb d = eb <#~> if _ then d else mempty"""
        ]
  }
