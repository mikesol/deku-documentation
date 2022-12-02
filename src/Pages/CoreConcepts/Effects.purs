module Pages.CoreConcepts.Effects where

import Prelude

import Control.Alt ((<|>))
import Contracts (Page, page)
import Deku.Attribute ((!:=))
import Deku.Attributes (href_)
import Deku.Control (text_)
import Deku.DOM as D
import Pages.CoreConcepts.Effects.BindingToEffects (bindingToEffects)
import Pages.CoreConcepts.Effects.Hydration (hydration)
import Pages.CoreConcepts.Effects.LifecycleMethods (lifecycleMethods)
import Router.ADT (Route(..))

effects :: forall lock payload. Page lock payload
effects = page
  { route: Effects
  , topmatter: pure
      [ D.p (D.Class !:= "lead")
          [ text_ "How Deku manages side effects."
          ]
      , D.p_
          [ text_
              "If you're familiar with React or Halogen, the word \"effect\" is often used to refer to one of two related concepts:"
          ]
      , D.ul_
          [ D.li_
              [ text_ "Lifecycle effects ("
              , D.a
                  ( D.Target !:= "_blank" <|> href_
                      "https://reactjs.org/docs/hooks-effect.html#example-using-hooks-1"
                  )
                  [ text_ "React" ]
              , text_ " | "
              , D.a
                  ( D.Target !:= "_blank" <|> href_
                      "https://purescript-halogen.github.io/purescript-halogen/guide/04-Lifecycles-Subscriptions.html"
                  )
                  [ text_ "Halogen" ]
              , text_ ")."
              ]
          , D.li_
              [ text_ "Effect hooks ("
              , D.a
                  ( D.Target !:= "_blank" <|> href_
                      "https://reactjs.org/docs/hooks-effect.html"
                  )
                  [ text_ "React" ]
              , text_ " | "
              , D.a
                  ( D.Target !:= "_blank" <|> href_
                      "https://github.com/thomashoneyman/purescript-halogen-hooks/blob/main/docs/03-Effect-Hook.md"
                  )
                  [ text_ "Halogen" ]
              , text_ ")."
              ]
          ]
      , D.p_
          [ text_
              "While these patterns are possible in Deku, the framework prefers an alternate model of effect management where side effects are completely determined by the enclosing scope. For example, if there is a component X that requires the result of effect Y and should perform effect Z when it leaves the page, that effect should be the responsibility of the element that controls the component's presence and absence."
          ]
      , D.p_
          [ text_
              "That being said, there are ways to get around this that come in handy in a pinch! This section will explore the Deku effect's philosophy and also present some methods to use when you need tools closer to the React/Halogen model."
          ]
      ]
  , sections:
      [ hydration, bindingToEffects, lifecycleMethods ]
  }
