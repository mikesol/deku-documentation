module Pages.CoreConcepts.Effects where

import Prelude

import Contracts (Page, page)

import Deku.DOM.Attributes as DA
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.BindingToEffects (bindingToEffects)
import Pages.CoreConcepts.Effects.Hydration (hydration)
import Pages.CoreConcepts.Effects.LifecycleMethods (lifecycleMethods)
import Router.ADT (Route(..))

effects :: Page
effects = page
  { route: Effects
  , topmatter: pure
      [ D.p [ DA.klass_ "lead" ]
          [ text_
              "A lesson on inverting control, or \"noctlor\" (that's control inverted)."
          ]
      , D.p_
          [ text_
              "If you’re familiar with React or Halogen, the word "
          , D.i__ "effect"
          , text_ " is often used to refer to one of two related concepts:"
          ]
      , D.ul_
          [ D.li_
              [ text_ "Lifecycle effects ("
              , D.a
                  [ DA.target_ "_blank"
                  , DA.href_
                      "https://reactjs.org/docs/hooks-effect.html#example-using-hooks-1"
                  ]
                  [ text_ "React" ]
              , text_ " | "
              , D.a
                  [ DA.target_ "_blank"
                  , DA.href_
                      "https://purescript-halogen.github.io/purescript-halogen/guide/04-Lifecycles-Subscriptions.html"
                  ]
                  [ text_ "Halogen" ]
              , text_ ")."
              ]
          , D.li_
              [ text_ "Effect hooks ("
              , D.a
                  [ DA.target_ "_blank"
                  , DA.href_
                      "https://reactjs.org/docs/hooks-effect.html"
                  ]
                  [ text_ "React" ]
              , text_ " | "
              , D.a
                  [ DA.target_ "_blank"
                  , DA.href_
                      "https://github.com/thomashoneyman/purescript-halogen-hooks/blob/main/docs/03-Effect-Hook.md"
                  ]
                  [ text_ "Halogen" ]
              , text_ ")."
              ]
          ]
      , D.p_
          [ text_
              "In both frameworks, the mere presence or absence of a component can trigger all sorts of side effects like REST API calls or robot arms moving. Deku offers no such accoutrements (sorry, robots). Instead, "
          , D.i__
              "side effects are completely initiated by a component's enclosing scope."
          ]
      , D.p_
          [ text_
              "Consider the following typical flow in a garden-variety web app:"
          ]
      , D.ul_
          [ D.li_
              [ text_ "Someone clicks on a button, revealing a component." ]
          , D.li_
              [ text_ "This component has some effectful initialization code." ]
          , D.li_
              [ text_
                  "When the component goes off the page, it also has some effectful teardown code."
              ]
          ]
      , D.p_
          [ text_
              "In Deku, those effects are the responsibility of the parent component. If there's no parent, it's the responsibility of the app's initialization code."
          ]
      , D.p_
          [ text_
              "This section will explore Deku's effect philosophy and also present some strategies to use when you just can't shake those old React/Halogen effectful habits (we've all been there, you’re not alone)."
          ]
      ]
  , sections:
      [ hydration, bindingToEffects, lifecycleMethods ]
  }
