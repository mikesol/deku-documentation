module Pages.CoreConcepts.State where

import Prelude

import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.State.HookingIntoTheDOM (hookingIntoTheDOM)
import Pages.CoreConcepts.State.StateWithoutInitialValues (stateWithoutInitialValues)
import Pages.CoreConcepts.State.TheStateHook (theStateHook)
import Router.ADT (Route(..))

state :: Page
state = page
  { route: State
  , topmatter: pure
      [ D.p [D.Class !:= "lead"]
          [ text_ "Learn how to use State Hooks in Deku."
          ]
      , D.p__
          "In 2018, Sophie Alpert and Dan Abramov introduced React Hooks, a revolutionary way to manage stateful logic in component-based UI frameworks. Their mouths agape, the world of framework builders fell into three categories."
      , D.ol_
          [ D.li__
              "Those who bemoaned having invented something hooks-like several years earlier only to see Facebook take the credit."
          , D.li__
              "Those who quickly rushed to implement hooks into their frameworks to ride on the coattail's of Facebook's success."
          , D.li__
              "Those who rebranded some feature of their framework as \"hooks\" so as not to miss out on the craze without needing to expend much effort."
          ]
      , D.p_
          [ text_
              "Yours truly falls into all three categories, and it is with great pride that I introduce you to Deku's state-management paradigm "
          , D.i__ "à la"
          , text_ " React, Deku's "
          , D.b__ " State Hooks"
          , text_ "!"
          ]
      ]
  , sections:
      [ theStateHook, hookingIntoTheDOM, stateWithoutInitialValues ]
  }
