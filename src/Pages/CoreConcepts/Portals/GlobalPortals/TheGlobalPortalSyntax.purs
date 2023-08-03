module Pages.CoreConcepts.Portals.GlobalPortals.TheGlobalPortalSyntax where

import Prelude

import Components.Code (psCode)
import Contracts (CollapseState(..), Subsection, getExample, subsection)
import Data.Maybe (Maybe(..))
import Deku.Control (text)
import Deku.DOM as D
import Examples as Examples

theGlobalPortalSyntax :: Subsection
theGlobalPortalSyntax = subsection
  { title: "The global portal syntax"
  , matter: do
      example <- getExample StartExapanded Nothing Examples.TheGlobalPortalSyntax
      pure [ D.p_
          [ text
              "The global portal syntax looks a lot like the hooks syntax. We use a left-bind in a "
          , D.code__ "Deku.do"
          , text
              " bloc to create a value that will be used later. But instead of creating a hook, we create a component. In the example below, look how "
          , D.code__ "globalPortal1"
          , text
              "is used to create a single component that is consumed by other components."
          ]
      , D.p__ "And, as y'all know, the result is the following."
      , example
      , D.p_
          [ text
              "While using a portal looks like using a vanilla Deku node, don't let it fool you! These two snippets are different: "
          ]
      , psCode
          """let a = Deku.div_ [ text "hi" ]
a <- globalPortal1 (Deku.div_ [ text "hi" ])"""
      , D.p_
          [ text
              "Portals are created with a left bind, and as such are referentially opaque. That means that, when a portal is created, it represents "
          , D.i__ "a single DOM node that exists"
          , text ", as opposed to a template for a DOM node."
          ]
      , D.p__
          "Relating this concept to the example above, let's zoom in on the following line of code:"
      , psCode "vid <- globalPortal1 myVideo"
      , D.p_
          [ text "The term "
          , D.code__ "vid"
          , text
              " is one single instantiation of our video. On the other hand, if we had passed "
          , D.code__ "myVideo"
          , text " to the "
          , D.code__ "moveSpriteHere"
          , text
              " function, we would be working with a referentially transparent object that acts as a blueprint for a node to construct as opposed to an actual node."
          ]
      , D.p__
          "Because DOM nodes can only appear in one place in the DOM, when a portal is used multiple times, the behavior is undefined. For that reason, in your application logic, it is important to make sure that a portal only ever appears in at most one place."
      ]
  }
