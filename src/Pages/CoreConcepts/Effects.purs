module Pages.CoreConcepts.Effects where

import Prelude

import Control.Alt ((<|>))
import Contracts (Page, page)
import Deku.Attribute ((:=))
import Deku.Attributes (href)
import Deku.Control (text)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.BindingToEffects (bindingToEffects)
import Pages.CoreConcepts.Effects.Hydration (hydration)
import Pages.CoreConcepts.Effects.LifecycleMethods (lifecycleMethods)
import Router.ADT (Route(..))

effects :: Page
effects = page
  { route: Effects
  , topmatter: pure
      [ D.p [D.Class := "lead"]
          [ text "How Deku manages side effects."
          ]
      , D.p_
          [ text
              "If you're familiar with React or Halogen, the word \"effect\" is often used to refer to one of two related concepts:"
          ]
      , D.ul_
          [ D.li_
              [ text "Lifecycle effects ("
              , D.a
                  [D.Target := "_blank" <|> href
                      "https://reactjs.org/docs/hooks-effect.html#example-using-hooks-1"
                  ]
                  [ text "React" ]
              , text " | "
              , D.a
                  [D.Target := "_blank" <|> href
                      "https://purescript-halogen.github.io/purescript-halogen/guide/04-Lifecycles-Subscriptions.html"
                  ]
                  [ text "Halogen" ]
              , text ")."
              ]
          , D.li_
              [ text "Effect hooks ("
              , D.a
                  [D.Target := "_blank" <|> href
                      "https://reactjs.org/docs/hooks-effect.html"
                  ]
                  [ text "React" ]
              , text " | "
              , D.a
                  [D.Target := "_blank" <|> href
                      "https://github.com/thomashoneyman/purescript-halogen-hooks/blob/main/docs/03-Effect-Hook.md"
                  ]
                  [ text "Halogen" ]
              , text ")."
              ]
          ]
      , D.p_
          [ text
              "While these patterns are possible in Deku, the framework prefers an alternate model of effect management where side effects are completely determined by the enclosing scope. For example, if there is a component X that requires the result of effect Y in order to mount and should perform effect Z when it leaves the page, those effects should be the responsibility of the element that controls the component's presence and absence."
          ]
      , D.p_
          [ text
              "This section will explore Deku's effect philosophy and also present some methods to use when you need tools closer to the React/Halogen model."
          ]
      ]
  , sections:
      [ hydration, bindingToEffects, lifecycleMethods ]
  }
