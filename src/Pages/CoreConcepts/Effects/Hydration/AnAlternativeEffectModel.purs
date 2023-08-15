module Pages.CoreConcepts.Effects.Hydration.AnAlternativeEffectModel where

import Prelude

import Contracts (Subsection, subsection)
import Deku.Attributes (klass, klass_)
import Deku.Control (text, text_)
import Deku.DOM as D

anAlternativeEffectModel :: Subsection
anAlternativeEffectModel = subsection
  { title: "An alternative effect model"
  , matter: pure
      [ D.p_
          [ text_
              "First, a note on why Deku ❤️ hydration. Deku was developed to build games and musical instruments and has later been used for web apps. Because of that, the contributors developed a culture of components being as \"dumb\" as possible. This means that, when a component mounts or unmounts from an application, the act of appearing or disappearing should have minimal impact on the UI."
          ]
      , D.p_
          [ text_
              "Later on in the history of the devleopment of the framework, methods were added to work with components mounting and unmounting. These proved useful for sanity checks - for example, if a large project could not risk an audio context accidentally staying on on a page turn, it sometimes proved more practical for a component to "
          , D.i__ "always"
          , text_ " turn off audio when it disappeared."
          ]
      , D.p_
          [ text_
              "From this, a culture developed where libraries and foundational components in projects were hydrated with effects so that components never shipped with a built-in performance penalty, whereas if a project grew too large or cumbersome to refactor, quick fixes were applied with lifecycle effects."
          ]
      , D.p_
          [ text_
              "Ultimately, the style you use to code your Deku app is up to you! But if you're writing a game and aiming for 60 FPS, you can't mess around. "
          , D.span [ klass_ "underline" ]
              [ text_
                  "Don't have components' presence or absence in the DOM trigger a bunch of side effects"
              ]
          , text_
              ". Manage your effects separately from the UI layer and your players will thank you!"
          ]
      ]
  }
